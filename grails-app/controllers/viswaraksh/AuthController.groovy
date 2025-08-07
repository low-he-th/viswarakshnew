package viswaraksh

import grails.converters.JSON

class AuthController {

def login(){

}

    def getOtp() {
        try {
            String phoneNumber = params.mob

            Auth auth = Auth.findByMobile(phoneNumber)
            if (auth) {
                User user = User.findByMobile(phoneNumber)
                if (user) {
                    String otpresponse = new AuthService().sendOTPviaSMS(phoneNumber)

                    session.setAttribute("userId", auth.user.id)
                    session.setAttribute("name", auth.user.name)
                    session.setAttribute("roleName", auth.user.roleName)
                    session.setAttribute("email", auth.user.email)
                    session.setAttribute("mobile", auth.user.mobile)
                    session.setAttribute("dateCreated", auth.user.dateCreated)
                    session.setAttribute("web", true)
                    session.setMaxInactiveInterval(-1)

                    render([success: true, showOTPField: true, status: otpresponse] as JSON)
                    return
                }
            }

            render([success: false] as JSON)

        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }

    def logout(){
        session.invalidate()
        respond null, status: 200, formats: ['json']

    }

    def verifyOtp() {
        try {

            String loginOTP = params.loginOTP
            String phoneNumber = params.mob
            Auth auth = Auth.findByMobile(phoneNumber)

            byte[] salt = new AuthService().toByteArray(auth.getWebPassword().split("_")[1])
            //hash the password sent from client
            String password1 = new AuthService().toHexString(new AuthService().hash(loginOTP.toCharArray(), salt))
            //replace original password with hashed password in client request
            String pass = password1 + "_" + auth.getWebPassword().split("_")[1]
            Auth passAuth = Auth.findByMobileAndWebPassword(phoneNumber, pass)
//        Auth auth = Auth.findByMobileAndWebPassword(phoneNumber,loginOTP)
            if (passAuth) {
                User user = User.findByMobile(phoneNumber)
                if (user) {

                    respond user, status: 200, format: ['json']
                }
            }
        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }

    def register() {

    }

    def getOtpRegister() {
        try {

            String registerPhone = params.registerPhone
            String registerName = params.registerName
            String registerEmail = params.registerEmail
            String resendOtp = params.resendOtp
            if(resendOtp){
                String otpresponse = new AuthService().sendOTPviaSMS(registerPhone)
                User checkMobile = User.findByMobile(registerPhone)
                respond checkMobile, status: 200, format: ['json']
                return
            }

            String demo = new Constants().ADMIN_DEMO_USER
            List<String> demoUserList = demo.tokenize(',')
            boolean isDemoUser = demoUserList.contains(registerPhone)

            User checkMobile = User.findByMobile(registerPhone)
            if (checkMobile) {
                respond checkMobile, status: 401, format: ['json']
                return
            }

            User user = new User()
            user.setName(registerName)
            user.setEmail(registerEmail)
            user.setMobile(registerPhone)
            if (isDemoUser) {
                user.setRoleName("ADMIN")
            } else {
                user.setRoleName("USER")
            }

            User users = user.save(flush: true)
            if (users) {
                Auth auth = new Auth()
                auth.setMobile(registerPhone)
                auth.setUser(users)
                auth.setUsername(users.name)
                Auth auths = auth.save(flush: true)
                if (auths) {
                    String otpresponse = new AuthService().sendOTPviaSMS(registerPhone)

                    session.setAttribute("userId", auth.user.id)
                    session.setAttribute("name", auth.user.name)
                    session.setAttribute("roleName", auth.user.roleName)
                    session.setAttribute("email", auth.user.email)
                    session.setAttribute("mobile", auth.user.mobile)
                    session.setAttribute("dateCreated", auth.user.dateCreated)
                    session.setAttribute("address", auth.user.address)
                    session.setAttribute("web", true)
                    session.setMaxInactiveInterval(-1)

                    respond auths, status: 200, format: ['json']
                }
            }
        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }

    def verifyOtpRegister() {
        try {

            String phoneNumber = params.registerPhone
            String registerOTP = params.registerOTP

            Auth auth = Auth.findByMobile(phoneNumber)

            byte[] salt = new AuthService().toByteArray(auth.getWebPassword().split("_")[1])
            //hash the password sent from client
            String password1 = new AuthService().toHexString(new AuthService().hash(registerOTP.toCharArray(), salt))
            //replace original password with hashed password in client request
            String pass = password1 + "_" + auth.getWebPassword().split("_")[1]
            Auth passAuth = Auth.findByMobileAndWebPassword(phoneNumber, pass)
//        Auth auth = Auth.findByMobileAndWebPassword(phoneNumber,loginOTP)
            if (passAuth) {
                User user = User.findByMobile(phoneNumber)
                if (user) {
                    respond user, status: 200, format: ['json']

                }
            }
        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }


}
