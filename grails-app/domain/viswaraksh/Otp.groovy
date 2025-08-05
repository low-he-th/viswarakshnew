package viswaraksh

import grails.gorm.annotation.Entity

/**
 * Domain to store OTP for user login
 **/
@Entity
class Otp implements Serializable {

    String mobile
    String webOtp
    String type


    Date dateCreated
    Date lastUpdated


    boolean isUpdatable
    static transients = ['isUpdatable']
    static mapWith = "mongo"

    static constraints = {
        type nullable: true
        mobile maxSize: 10
        webOtp nullable: true

    }

    def beforeUpdate() {

        if (!this.isUpdatable) {
            System.out.println("Otp Domain update Prevented " + new Date().toString() + " ,OtpId: " + this.id)
            return false
        } else {
            System.out.println("Otp domain Updated " + new Date().toString() + " ,OtpId: " + this.id)
        }
    }
}
