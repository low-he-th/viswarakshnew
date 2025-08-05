package viswaraksh

import grails.web.servlet.mvc.GrailsParameterMap
import org.grails.web.json.JSONObject

class AdminController {

    def adminPanel() {
        try {


        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }

    def addAndEditProduct() {
        try {
            Product product

            if (params.editId) {
                product = Product.findById(Long.parseLong(params.editId))
                product.isUpdatable = true
            } else {
                product = new Product()
            }

            // Set all fields from params
            product.name = params.name?.trim()
            product.price = params.price?.trim()
            product.weight = params.weight?.trim()
            product.image = params.image?.trim()
            product.description = params.description?.trim()
            product.benefits = params.benefits?.trim()
            product.ingredients = params.ingredients?.trim()
            product.expiry = params.expiry?.trim()
            product.mfgDate = params.mfgDate?.trim()
            product.stock = params.stock?.trim()
            product.offer = params.offer?.trim()
            product.details = params.details?.trim()

            Product products = product.save(flush: true, failOnError: true)
            if(products) {
                respond products, formats: ['json'], status: 200
            }
        } catch (Exception ex) {
            System.err.println("Controller: ${controllerName}, Method: ${actionName} Exception: $ex")
            log.error("Controller: ${controllerName}, Method: ${actionName} Exception: $ex")
            response.status = 400
        }
    }

    def deleteProduct() {
        try {
            Product product = Product.findById(Long.parseLong(params.deleteId))
            product.isUpdatable = true
            Product products = product.delete(flush: true)
            if(!products) {
                respond products, formats: ['json'],status: 200
            }
        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }

    def getProduct()
    {
        try
        {
            GrailsParameterMap parameterMap = getParams()
            String searchTerm = parameterMap.get("search[value]")
            String orderColumnId = parameterMap.get("order[0][column]")
            String orderDir = parameterMap.get("order[0][dir]")

            // For sorting
            String orderColumn = "id"
            switch (orderColumnId)
            {
                case '0':
                    orderColumn = "id"
                    break
            }

            def list
            def productList = Product.createCriteria()

            list = productList.list(max: params.length, offset: params.start) {
                if (searchTerm != "")
                {
                    or {
                        ilike('name', "%" + searchTerm + "%")

                    }
                }

                eq('deleted', false)
                order("id", "desc")
                order(orderColumn, orderDir)
            }


            def recordsTotal = list.totalCount
            JSONObject jsonObject = new JSONObject()
            jsonObject.put("draw", params.draw)
            jsonObject.put("recordsTotal", recordsTotal)
            jsonObject.put("recordsFiltered", recordsTotal)
            jsonObject.put("data", list)
            respond jsonObject, formats: ['json']

        }
        catch (Exception ex)
        {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }
}
