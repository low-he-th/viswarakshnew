package viswaraksh

import gorm.logical.delete.LogicalDelete

class User  implements Serializable, LogicalDelete<User> {

    String name
    String email
    String mobile
    String roleName

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: true
        email nullable: true, blank: true, email: true
        mobile nullable: true, size: 10..12, unique: true
        roleName nullable: true
    }

    static mapWith = "mongo"
    static mapping = {
    }
    boolean isUpdatable
    static transients = ['isUpdatable']

    def beforeUpdate() {

        if (!this.isUpdatable) {
            System.out.println("User Domain update Prevented " + new Date().toString() + " ,UserId: " + this.id)
            return false
        } else {
            System.out.println("User domain Updated " + new Date().toString() + " ,UserId: " + this.id)
        }
    }
}
