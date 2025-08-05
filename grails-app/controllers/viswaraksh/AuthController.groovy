package viswaraksh

import grails.converters.JSON
import org.grails.web.json.JSONObject

class AuthController {

def login(){

}

    def verifyAndGenerateOtp() {
        try {
            JSONObject jsonObject = new JSONObject(JSON.parse(request.reader.text) as JSONObject)

            String phonenumber = jsonObject.get("phoneNumber")

            Auth auth = Auth.findByMobile(phonenumber)
            if (auth) {
                User userObj = User.findByMobile(phonenumber)
                String otpresponse = ''
                def response = [:]

                    otpresponse = new AuthService().sendOTPviaSMS(phonenumber)


                session.setAttribute("user_id", auth.user.id)
                session.setAttribute("roles", auth.user.roleName)



                session.setAttribute("username", auth.user.name)
                session.setAttribute("userid", auth.user.id)
                session.setAttribute("mobile", auth.user.mobile)
                session.setAttribute("web", true)
                session.setMaxInactiveInterval(-1)
                User user = User.findById(auth.user.id)
                user.setIsUpdatable(true)
                user.save(flush: true)


                response.success = true
                response.showOTPField = true
                response.status = otpresponse // Add the status to the response
                render response as JSON
            } else {
                def response = [:]
                response.success = false
                render response as JSON
            }

        }
        catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }

    }
}
