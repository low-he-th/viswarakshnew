package viswaraksh


import grails.converters.JSON
import javax.ws.rs.client.Client
import javax.ws.rs.client.ClientBuilder
import javax.ws.rs.core.Response

class DashboardController {

    def dashboard() { }

    def about(){


    }


    def contact(){

    }



    def sendMessageContact() {
        def contactData = [
                fullName: params.fullName,
                email   : params.email,
                phone   : params.phone,
                subject : params.subject,
                message : params.message
        ]


        User user = User.findByRoleName("ADMIN")


        try {
            // Convert contact data to JSON string for the SMS message
            String messageJson = (contactData as JSON).toString()
            String twoFactorConf = "SomeMessage" // Replace with actual value

            Response smsGatewayResponse = sendOTPMessage(user.mobile, messageJson, twoFactorConf)

            if (smsGatewayResponse?.status == 200) {
                respond([status: "success", data: contactData], formats: ['json'], status: 200)
            } else {
                respond([error: "Failed to send SMS"], formats: ['json'], status: 500)
            }
        } catch (Exception e) {
            log.error("Error while sending contact message", e)
            respond([error: "Server error"], formats: ['json'], status: 500)
        }
    }

    static Response sendOTPMessage(String mobile, String messageJson, String twoFactorMessage) {
        if (!mobile || !messageJson || !twoFactorMessage) {
            println("Missing parameters for SMS")
            return null
        }

        try {
            String encodedMessage = URLEncoder.encode(messageJson, "UTF-8")
            String encodedTwoFactor = URLEncoder.encode(twoFactorMessage, "UTF-8")
            String url = "https://2factor.in/API/V1/597b06b4-2691-11e8-a895-0200cd936042/SMS/${mobile}/${encodedMessage}/${encodedTwoFactor}"

            Client client = ClientBuilder.newClient()
            Response apiResponse = client.target(url).request().get()
            client.close()

            if (apiResponse.status == 200) {
                println("OTP sent: $messageJson")
            } else {
                println("Failed to send OTP to: $mobile")
            }

            return apiResponse
        } catch (Exception e) {
            println("Exception in sending OTP: ${e.message}")
            return null
        }
    }

}
