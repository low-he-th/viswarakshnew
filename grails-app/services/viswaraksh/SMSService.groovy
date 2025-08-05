package viswaraksh


import grails.gorm.transactions.Transactional

import javax.ws.rs.client.Client
import javax.ws.rs.client.ClientBuilder
import javax.ws.rs.client.Entity
import javax.ws.rs.core.Form
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Transactional
class SMSService {

    def serviceMethod() {
    }

    Response sendTextMessage(String mobile, String message) {

            Form form = new Form();
            form.param("From", "CAPTEC")
            form.param("To", mobile)
            form.param("Msg", message)
            String url = "https://2factor.in/API/V1/597b06b4-2691-11e8-a895-0200cd936042/ADDON_SERVICES/SEND/TSMS"
            ch.qos.logback.core.net.server.Client client = ClientBuilder.newClient()
            Response apiResponse = client.target(url)
                    .request(MediaType.APPLICATION_FORM_URLENCODED)
                    .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED_TYPE))

            if (apiResponse.status == 200) {



            } else {

            }

            return apiResponse

        println("Available SMS is empty")
        return null

    }

    /**
     * this method is to send Otp to user
     * @param mobile is mobile number of user
     * @param msg is the data to send
     * @return response from the client server (SMS server)
     */
    static Response sendOTPMessage(String mobile, String message, String twoFactor) {

        if (mobile != null && twoFactor != "") {
//            Form form = new Form();
//            form.param("From", "CAPTEC")
//            form.param("To", mobile)
//            form.param("Msg", message)
            String url = "https://2factor.in/API/V1/597b06b4-2691-11e8-a895-0200cd936042/SMS/" + mobile + "/" + message + "/" + twoFactor
            Client client = ClientBuilder.newClient()
//            Response apiResponse = client.target(url)
//                    .request(MediaType.APPLICATION_FORM_URLENCODED)
//                    .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED_TYPE))
            Response apiResponse = client.target(url).request().get()

            if (apiResponse.status == 200) {
             println('OTP sent to ' + mobile)
            } else {

                println('OTP not sent to ' + mobile)
            }

            return apiResponse
        }
        println("Available SMS is empty")
        return null
    }
}
