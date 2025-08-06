package viswaraksh

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }


//        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')


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
        "/userproduct"(controller: "product", action: "product")
        "/add/to/cart"(controller: "product", action: "addToCart")
        "/add/to/cart"(controller: "product", action: "addToCart")


        //Payment
        "/payment"(controller: "payment", action: "payment")


    }
}
