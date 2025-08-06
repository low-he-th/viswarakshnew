package viswaraksh

import grails.web.servlet.mvc.GrailsParameterMap
import org.grails.web.json.JSONObject
import products.Product

import java.text.SimpleDateFormat


class ProductController {

    def product() {}

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
            product.setExpiry(params.expiry)
            def offer = params.int("offer")
            product.setOffer(offer)
            def stock = params.int("stock")
            product.setStock(stock)
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy")
            if (params.mfgDate != null) {
                product.setMfgDate(formatter.parse(params.mfgDate))
            }
            if (params.expiry != null) {
                product.setExpiry(formatter.parse(params.expiry))
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
                product.setExpiry(params.expiry)
                def offer = params.int("offer")
                product.setOffer(offer)
                def stock = params.int("stock")
                product.setStock(stock)
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy")
                if (params.mfgDate != null) {
                    product.setMfgDate(formatter.parse(params.mfgDate))
                }
                if (params.expiry != null) {
                    product.setExpiry(formatter.parse(params.expiry))
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
        String searchTerm = parameterMap.get("search[value]")
        String orderColumnId = parameterMap.get("order[0][column]")
        String orderDir = parameterMap.get("order[0][dir]")
        searchTerm = searchTerm.trim()

        //for sorting
        String orderColumn = "id"
        switch (orderColumnId) {
            case '1':
                orderColumn = "id"
                break;
            case '2':
                orderColumn = "name"
                break;
            case '3':
                orderColumn = "benefits"
                break;
            default:
                orderColumn = "id"
                break;
        }

        def reports
        def reportsCriteria = Product.createCriteria()
        //for searching
        if (searchTerm != "") {
            reports = reportsCriteria.list(max: params.length, offset: params.start) {
                or {
                    ilike('name', "%" + searchTerm + "%")
                    ilike('description', "%" + searchTerm + "%")
                    ilike('weight', "%" + searchTerm + "%")
                }
                eq('deleted', false)
                order(orderColumn, orderDir)
            }
        } else {
            reports = reportsCriteria.list(max: params.length, offset: params.start) {
                and {
                    eq('deleted', false)
                    order(orderColumn, orderDir)
                }
            }
        }

        def recordsTotal = reports.totalCount
        JSONObject jsonObject = new JSONObject()
        jsonObject.put("draw", params.draw)
        jsonObject.put("recordsTotal", recordsTotal)
        jsonObject.put("recordsFiltered", recordsTotal)
        jsonObject.put("data", reports)
        respond jsonObject, formats: ['json']
    }

    def delete() {
        try {
            def id = params.long('id')
            Product product = Product.findById(id)
            if (product) {
                product.setIsUpdatable(true)
                def deleted = product.delete(flush: true)
                if (deleted == null) {
                    response.status = 200
                } else {
                    response.status = 400
                }
            }
        }
        catch (Exception ex) {
            println("Exception " + ex)
        }
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
}
