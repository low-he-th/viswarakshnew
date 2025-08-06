package carts

import gorm.logical.delete.LogicalDelete
import viswaraksh.User

class Cart implements Serializable, LogicalDelete<Cart> {
    User publicUser
    List<CartItem> items = []

    Date dateCreated
    Date lastUpdated
    boolean isHidden

    static embedded = ['items']

    static constraints = {
        publicUser nullable: false
    }

    static mapWith = "mongo"
    static transients = ['isUpdatable']
    boolean isUpdatable

    def beforeUpdate() {
        if (!this.isUpdatable) {
            println("Product update prevented at ${new Date()} , ProductId: ${this.id}")
            return false
        } else {
            println("Product updated at ${new Date()} , ProductId: ${this.id}")
        }
    }
}
