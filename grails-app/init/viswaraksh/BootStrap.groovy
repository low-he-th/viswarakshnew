package viswaraksh

import grails.converters.JSON
import order.Order
import products.Product

import java.text.SimpleDateFormat

class BootStrap {

    def init = { servletContext ->
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Kolkata"))
        JSON.registerObjectMarshaller(Date) {
            // Define the date format using SimpleDateFormat
            def sdf = new SimpleDateFormat('dd/MM/yyyy HH:mm:ss')
            return sdf.format(it)
        }


        def user = User.get(1)       // assuming user with ID 1 exists
        def product = Product.get(7) // assuming product with ID 1 exists

        if (user && product) {
            def order1 = new Order(user: user, product: product, amount: 500, orderId: "ORD1003",status:"Delivered")
            order1.save(flush: true)

            def order2 = new Order(user: user, product: product, amount: 600, orderId: "ORD1004",status:"Processing")
            order2.save(flush: true)

            println "Sample orders created."
        } else {
            println "User or Product not found. Please ensure they exist."
        }

    }
    def destroy = {
    }
}
