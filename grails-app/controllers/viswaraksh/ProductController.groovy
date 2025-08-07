package viswaraksh


import products.Product

class ProductController {

    def product() {}

    def getProduct() {
        try {
            ArrayList<Product> product = Product.findAllByDeleted(false)
            respond product, formats: ['json'], status: 200
        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }


    def productView() {
        try {
            String productId = params.id
            render(view: "productView", model: [productId: productId])
        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }

    def getProductView() {
        try {
            Product product = Product.findById(params.productId)
            respond product, formats: ['json'], status: 200
        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }

}
