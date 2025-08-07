package products

import gorm.logical.delete.LogicalDelete
import viswaraksh.User

class ProductCart implements Serializable, LogicalDelete<ProductCart> {

    User user
    Product product
    int quantity

    Date dateCreated
    Date lastUpdated


    boolean isUpdatable
    static transients = ['isUpdatable']

    static mapWith = "mongo"

    static constraints = {
        user nullable: true
        product nullable: true
        quantity nullable: true

    }

    static mapping = {

    }

    def beforeUpdate() {
        if (!this.isUpdatable) {
            println("Product update prevented at ${new Date()} , ProductId: ${this.id}")
            return false
        } else {
            println("Product updated at ${new Date()} , ProductId: ${this.id}")
        }
    }
}
