package viswaraksh

import gorm.logical.delete.LogicalDelete

class SMSTemplate implements Serializable, LogicalDelete<SMSTemplate> {

    String name
    String templateId
    String template
    String smsType
    String smsFormat
    Date dateCreated
    Date lastUpdated

    boolean isUpdatable
    static transients = ['isUpdatable']
    static mapWith = "mongo"
    static constraints = {
        name nullable: true
        templateId nullable: true
        template nullable: true
        smsType nullable: true
        smsFormat nullable: true, sqlType: "longText"
    }

    def beforeUpdate() {

        if (!this.isUpdatable) {
            log.info("SMSTemplate Update Prevented " + new Date().toString() + " ,SMSTemplateid: " + this.id)
            return false
        } else {
            log.info("SMSTemplate Updated " + new Date().toString() + " ,SMSTemplateid: " + this.id)
        }
    }
}
