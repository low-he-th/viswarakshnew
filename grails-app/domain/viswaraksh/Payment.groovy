package viswaraksh

import gorm.logical.delete.LogicalDelete
import order.Order
import products.Product

class Payment implements Serializable, LogicalDelete<Payment> {

    Order order
    User user
    Product product
    int amount
    String method
    String status
    String transactionId

    Date dateCreated
    Date lastUpdated

    boolean isUpdatable
    static transients = ['isUpdatable']

    static mapWith = "mongo"

    static constraints = {
        status nullable: true
        user nullable: true
        order nullable: true
        product nullable: true
        transactionId nullable: true
        amount nullable: true
        method nullable: true

    }

    static mapping = {
    }

    def beforeUpdate() {
        if (!this.isUpdatable) {
            println("Payment update prevented at ${new Date()} , Payment: ${this.id}")
            return false
        } else {
            println("Payment updated at ${new Date()} , Payment: ${this.id}")
        }
    }
}
