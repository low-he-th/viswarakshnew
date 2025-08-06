package products

import gorm.logical.delete.LogicalDelete

class Product implements Serializable, LogicalDelete<Product> {

    String name
    String description
    double price
    String weight
    int stock
    String image = "NA"
    String ingredients
    String benefits
    Date mfgDate
    String expiry
    int offer = 0

    Date dateCreated
    Date lastUpdated
    boolean isHidden

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
    }

    static mapping = {
        description sqlType: 'longText'
        benefits sqlType: 'longText'
        ingredients sqlType: 'longText'
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
