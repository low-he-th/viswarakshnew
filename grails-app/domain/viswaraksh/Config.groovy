package viswaraksh

import gorm.logical.delete.LogicalDelete


class Config implements LogicalDelete<Config>, Serializable {
    String name
    String value
    String note

    Date dateCreated
    Date lastUpdated
    static constraints = {
        note nullable: true
        note maxSize: 500
    }

    static mapping = {
        note sqlType: "longText"
    }
    static mapWith = "mongo"

    boolean isUpdatable
    static transients = ['isUpdatable']

    def beforeUpdate() {

        if (!this.isUpdatable) {
            System.out.println("Config Domain update Prevented " + new Date().toString() + " ,ConfigId: " + this.id)
            return false
        } else {
            System.out.println("Config domain Updated " + new Date().toString() + " ,ConfigId: " + this.id)
        }
    }

//    @Override
//    public String toString() {
//        super.toString()
//        return "Config{" +
//                "id=" + id +
//                ", version=" + version +
//                ", name='" + name + '\'' +
//                ", value='" + value + '\'' +
//                ", note='" + note + '\'' +
//                ", dateCreated=" + dateCreated +
//                ", lastUpdated=" + lastUpdated +
//                ", isUpdatable=" + isUpdatable +
//                '}';
//    }
}
