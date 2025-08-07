package order

import gorm.logical.delete.LogicalDelete
import products.Product
import viswaraksh.User

class Order implements Serializable, LogicalDelete<Order> {

    User user
    Product product
    int amount
    String orderId
    String status

    Date dateCreated
    Date lastUpdated


    boolean isUpdatable
    static transients = ['isUpdatable']

    static mapWith = "mongo"

    static constraints = {
        user nullable: true
        product nullable: true
        orderId nullable: true
        amount nullable: true
    }

    static mapping = {

    }

    def beforeUpdate() {
        if (!this.isUpdatable) {
            println("Order update prevented at ${new Date()} , Order: ${this.id}")
            return false
        } else {
            println("Order updated at ${new Date()} , Order: ${this.id}")
        }
    }
}
