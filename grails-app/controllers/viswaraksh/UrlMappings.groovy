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


        // dashbaord
        "/admin"(controller: "admin", action: "adminPanel")
        "/add/product"(controller: "admin", action: "addAndEditProduct")
        "/delete/product"(controller: "admin", action: "deleteProduct")
        "/get/product"(controller: "admin", action: "getProduct")
    }
}
