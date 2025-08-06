package products

import gorm.logical.delete.LogicalDelete

class Category implements Serializable, LogicalDelete<Category> {
    String name
    String description
    Date dateCreated
    Date lastUpdated
    boolean isHidden

    static constraints = {
        name blank: false, unique: true
        description nullable: true
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
