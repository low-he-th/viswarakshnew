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
        "/add/product"(controller: "admin", action: "addAndEditProduct")
        "/delete/product"(controller: "admin", action: "deleteProduct")
        "/get/product"(controller: "admin", action: "getProduct")


        // About
        "/about"(controller: "dashboard", action: "about")

        // Contact
        "/contact"(controller: "dashboard", action: "contact")

        // User Product
        "/userproduct"(controller: "product", action: "productPage")
        "/addproduct"(controller: "product", action: "add")
        "/updateproduct"(controller: "product", action: "update")
        "/getproducts"(controller: "product", action: "getProducts")
        "/deleteproducts"(controller: "product", action: "delete")
        "/hideproduct"(controller: "product", action: "hideProduct")


        //Payment
        "/payment"(controller: "payment", action: "payment")


        //login
        "/login"(controller: "auth", action: "login")


    }
}
