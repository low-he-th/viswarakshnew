package viswaraksh

import gorm.logical.delete.LogicalDelete

class Payment implements Serializable, LogicalDelete<Payment> {

    String name

    Date dateCreated
    Date lastUpdated

    boolean isUpdatable
    static transients = ['isUpdatable']

    static mapWith = "mongo"

    static constraints = {
        name nullable: true

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
