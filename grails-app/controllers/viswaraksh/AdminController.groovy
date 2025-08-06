package viswaraksh

import grails.web.servlet.mvc.GrailsParameterMap
import org.grails.web.json.JSONObject
import products.Product

class AdminController {

    def adminPanel() {
        try {


        } catch (Exception ex) {
            System.err.println("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            log.error("Controller:" + controllerName + ", Method:" + actionName + " Exception:" + ex)
            response.status = 400
        }
    }

}
