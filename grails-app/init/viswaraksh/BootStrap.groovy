package viswaraksh

import grails.converters.JSON

import java.text.SimpleDateFormat

class BootStrap {

    def init = { servletContext ->
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Kolkata"))
        JSON.registerObjectMarshaller(Date) {
            // Define the date format using SimpleDateFormat
            def sdf = new SimpleDateFormat('dd/MM/yyyy HH:mm:ss')
            return sdf.format(it)
        }



    }
    def destroy = {
    }
}
