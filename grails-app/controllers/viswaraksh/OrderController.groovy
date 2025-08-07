package viswaraksh

import grails.converters.JSON
import grails.web.servlet.mvc.GrailsParameterMap
import order.Order

class OrderController {

    def index() {}

    def add() {
        try {
//            Order
        }
        catch (Exception ex) {
            println("Eception:" + ex)
        }
    }

    def get() {
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
                orderColumn = "amount"
                break
            case "3":
                orderColumn = "orderId"
                break
            default:
                orderColumn = "id"
        }

        def orderList
        def criteria = Order.createCriteria()

        if (searchTerm) {
            orderList = criteria.list(max: max, offset: offset) {
                or {
                    ilike("amount", "%${searchTerm}%")
                    ilike("orderId", "%${searchTerm}%")
                }
                eq("deleted", false)
                order(orderColumn, orderDir)
            }
        } else {
            orderList = criteria.list(max: max, offset: offset) {
                eq("deleted", false)
                order(orderColumn, orderDir)
            }
        }

        // Prepare lightweight JSON list to return
        def orderData = orderList.collect { order ->
            [
                    id                : order.id,
                    status            : order.status,
                    username          : order?.user?.name,
                    productdescription: order?.product?.description ?: "NA",
                    productprice      : order?.product?.price ?: 0,
                    productweight     : order?.product?.weight ?: "NA",
                    productimage      : order?.product?.image ?: "/images/default.png",
                    amount            : order.amount ?: "NA",
                    orderId           : order.orderId ?: "NA",
                    dateCreated       : order.dateCreated ?: "NA",
                    lastUpdated       : order.lastUpdated ?: "NA"
            ]
        }


        // Final JSON response
        def jsonResponse = [
                draw           : draw,
                recordsTotal   : orderList.totalCount,
                recordsFiltered: orderList.totalCount,
                data           : orderData
        ]

        render jsonResponse as JSON
    }
}
