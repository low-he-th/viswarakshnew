package viswaraksh

import gorm.logical.delete.LogicalDelete

class SMSLog implements Serializable, LogicalDelete<SMSLog> {
    boolean status
    String mobile
    String details
    Date date

    Date dateCreated
    Date lastUpdated

    static constraints = {

    }
    static mapWith = "mongo"
    boolean isUpdatable
    static transients = ['isUpdatable']

    def beforeUpdate() {
        if (!this.isUpdatable) {
            System.out.println("SMSLog Domain update Prevented " + new Date().toString() + " ,SMSLogid: " + this.id)
            return false
        } else {
            System.out.println("SMSLog domain Updated " + new Date().toString() + " ,SMSLogid: " + this.id)
        }
    }
}
