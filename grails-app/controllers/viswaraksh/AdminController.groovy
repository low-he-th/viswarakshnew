package viswaraksh

import grails.converters.JSON
import grails.web.servlet.mvc.GrailsParameterMap
import org.grails.web.json.JSONObject
import org.springframework.web.multipart.MultipartFile
import products.Product

import java.text.SimpleDateFormat

class AdminController {

    def adminPanel() {
        try {


        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }
    def add() {
        try {
            Product product = new Product()
            product.setName(params.name)
            product.setDescription(params.desc)
            def price = params.double("price")
            product.setPrice(price)
            product.setWeight(params.weight)
            product.setIngredients(params.ingredients)
            product.setBenefits(params.benefits)
            def offer = params.int("offer")
            product.setOffer(offer)
            def stock = params.int("stock")
            product.setStock(stock)
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
            if (params.mfgDate != null) {
                product.setMfgDate(formatter.parse(params.mfgDate))
            }
            if (params.expiry != null) {
                product.setExpiry(formatter.parse(params.expiry))
            }

            MultipartFile imageFile = params.imageFile
            if (imageFile && !imageFile.isEmpty()) {

                product.setImage(new UtilsService().uploadImage("product_image", "", imageFile))

            }
            def saved = product.save(flush: true)
            if (saved) {
                respond saved, formats: ['json'], status: 200
            }
        }
        catch (Exception ex) {
            println("Exception :" + ex)
        }
    }

    def update() {
        try {
            def id = params.long('id')
            Product product = Product.findById(id)
            if (product) {
                product.setIsUpdatable(true)
                product.setName(params.name)
                product.setDescription(params.desc)
                def price = params.double("price")
                product.setPrice(price)
                product.setWeight(params.weight)
                product.setIngredients(params.ingredients)
                product.setBenefits(params.benefits)
                def offer = params.int("offer")
                product.setOffer(offer)
                def stock = params.int("stock")
                product.setStock(stock)
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
                if (params.mfgDate != null) {
                    product.setMfgDate(formatter.parse(params.mfgDate))
                }
                if (params.expiry != null) {
                    product.setExpiry(formatter.parse(params.expiry))
                }
                MultipartFile imageFile = params.imageFile
                if (imageFile && !imageFile.isEmpty()) {
                    product.setImage(new UtilsService().uploadImage("product_image", "", imageFile))
                }
                def saved = product.save(flush: true)
                if (saved) {
                    respond saved, formats: ['json'], status: 200
                }
            } else {
                response.status = 400
            }
        }
        catch (Exception ex) {
            println("Exception :" + ex)
        }
    }


    def getProducts() {
        GrailsParameterMap parameterMap = getParams()
        String searchTerm = parameterMap.get("search[value]") ?: ""
        String orderColumnId = parameterMap.get("order[0][column]") ?: "1"
        String orderDir = parameterMap.get("order[0][dir]") ?: "desc"
        int max = parameterMap.int("length") ?: 10
        int offset = parameterMap.int("start") ?: 0
        int draw = parameterMap.int("draw") ?: 1

        searchTerm = searchTerm.trim()

        // Determine the order column
        String orderColumn
        switch (orderColumnId) {
            case "1":
                orderColumn = "id"
                break
            case "2":
                orderColumn = "name"
                break
            case "3":
                orderColumn = "price"
                break
            case "4":
                orderColumn = "stock"
                break
            default:
                orderColumn = "id"
        }

        def productList
        def criteria = Product.createCriteria()

        if (searchTerm) {
            productList = criteria.list(max: max, offset: offset) {
                or {
                    ilike("name", "%${searchTerm}%")
                    ilike("description", "%${searchTerm}%")
                    ilike("weight", "%${searchTerm}%")
                }
                eq("deleted", false)
                order(orderColumn, orderDir)
            }
        } else {
            productList = criteria.list(max: max, offset: offset) {
                eq("deleted", false)
                order(orderColumn, orderDir)
            }
        }

        // Prepare lightweight JSON list to return
        def productData = productList.collect { product ->
            [
                    id         : product.id,
                    name       : product.name,
                    description: product.description ?: "NA",
                    price      : product.price ?: 0,
                    weight     : product.weight ?: "NA",
                    stock      : product.stock ?: 0,
                    image      : product.image ?: "/images/default.png",
                    ingredients: product.ingredients ?: "NA",
                    benefits   : product.benefits ?: "NA",
                    mfgDate    : product.mfgDate ?: "NA",
                    expiry     : product.expiry ?: "NA",
                    offer      : product.offer ?: 0,
                    dateCreated: product.dateCreated ?: "NA",
                    lastUpdated: product.lastUpdated ?: "NA",
                    isHidden   : product.isHidden
            ]
        }


        // Final JSON response
        def jsonResponse = [
                draw           : draw,
                recordsTotal   : productList.totalCount,
                recordsFiltered: productList.totalCount,
                data           : productData
        ]

        render jsonResponse as JSON
    }

    def hideProduct() {
        try {
            def id = params.long('id')
            def hide = params.boolean('hide')
            Product product = Product.findById(id)
            if (product) {
                product.setIsUpdatable(true)
                product.setIsHidden(hide)
                def saved = product.save(flush: true)
                if (saved) {
                    respond saved, formats: ['json'], status: 200
                } else {
                    response.status = 400
                }
            }
        }
        catch (Exception ex) {
            println("Exception " + ex)
        }
    }
    def delete() {
        try {
            def id = params.long('id')
            Product product = Product.findById(id)
            if (product) {
                product.setIsUpdatable(true)
                def deleted = product.delete(flush: true)
                if (deleted == null) {
                    JSONObject jsonObject = new JSONObject()
                    respond jsonObject, formats: ['json'], status: 200
                } else {
                    response.status = 400
                }
            }
        }
        catch (Exception ex) {
            println("Exception " + ex)
        }
    }


}
