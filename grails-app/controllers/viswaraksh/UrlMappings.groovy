package viswaraksh

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }


//        "/"(view:"/index")
        "500"(view: '/error')
        "404"(view: '/notFound')


        // dashbaord
        "/"(controller: "dashboard", action: "dashboard")


        // admin dashbaord
        "/admin"(controller: "admin", action: "adminPanel")
        "/addproduct"(controller: "admin", action: "add")
        "/updateproduct"(controller: "admin", action: "update")
        "/getproducts"(controller: "admin", action: "getProducts")
        "/deleteproducts"(controller: "admin", action: "delete")



        // About
        "/about"(controller: "dashboard", action: "about")

        // Contact
        "/contact"(controller: "dashboard", action: "contact")
        "/send/message/contact"(controller: "dashboard", action: "sendMessageContact")

        // User Product
        "/userproduct"(controller: "product", action: "product")
        "/get/userproduct"(controller: "product", action: "getProduct")
        "/productview"(controller: "product", action: "productView")
        "/get/product/view"(controller: "product", action: "getProductView")



        //Payment
        "/payment"(controller: "payment", action: "payment")

        //logout
        "/logout"(controller: "auth", action: "logout")

        //login
        "/login"(controller: "auth", action: "login")
        "/get/otp"(controller: "auth", action: "getOtp")
        "/verify/otp"(controller: "auth", action: "verifyOtp")

        //Register
        "/register"(controller: "auth", action: "register")
        "/get/otp/register"(controller: "auth", action: "getOtpRegister")
        "/verify/otp/register"(controller: "auth", action: "verifyOtpRegister")

        "/api/media/$path**"(controller: "fileLocation", action: "index")
    }
}
