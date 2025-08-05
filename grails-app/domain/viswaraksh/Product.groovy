package viswaraksh

import gorm.logical.delete.LogicalDelete

class Product implements Serializable, LogicalDelete<Product> {

    String name
    String price
    String weight
    String image
    String description
    String benefits
    String ingredients
    String expiry
    String mfgDate
    String stock
    String offer
    String details

    Date dateCreated
    Date lastUpdated

    boolean isUpdatable
    static transients = ['isUpdatable']

    static mapWith = "mongo"

    static constraints = {
        name nullable: true
        price nullable: true
        weight nullable: true
        image nullable: true
        description nullable: true
        benefits nullable: true
        ingredients nullable: true
        expiry nullable: true
        mfgDate nullable: true
        stock nullable: true
        offer nullable: true
        details nullable: true
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
