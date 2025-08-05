package viswaraksh

import gorm.logical.delete.LogicalDelete

class Auth implements Serializable, LogicalDelete<Auth> {
    String username
    String webPassword
    String mobile
    String imei
    User user

    Date dateCreated
    Date lastUpdated

    boolean isUpdatable
    static transients = ['isUpdatable']
    static mapWith = "mongo"

    static constraints = {
        user nullable: true
        username unique: true
        webPassword nullable: true
        mobile nullable: true
        imei nullable: true
    }
    def beforeUpdate()    {

        if (!this.isUpdatable)
        {
            System.out.println("Auth Domain update Prevented " + new Date().toString() + " ,AuthId: " + this.id)
            return false
        }
        else
        {
            System.out.println("Auth domain Updated " + new Date().toString() + " ,AuthId: " + this.id)
        }
    }
}
