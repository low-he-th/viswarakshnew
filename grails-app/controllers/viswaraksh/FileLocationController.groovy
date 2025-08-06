package viswaraksh

import org.apache.catalina.connector.ClientAbortException

import javax.ws.rs.ClientErrorException

class FileLocationController {

    def index() {
//        println("File Location Controller ")
        response.setHeader("X-Content-Type-Options", "nosniff")
        response.addHeader("X-XSS-Protection", "1; mode=block")
        response.addHeader("X-Frame-Options", "SAMEORIGIN")

        String defaultFileName = new FileManagementService().getApplicationPath() + "default.jpg";
        def path = params.path
        path = URLDecoder.decode(path, "UTF-8")
        if (path.toLowerCase().contains('keypair'))
        {
            response.status = 400
            return
        }

        if(path.toLowerCase().contains("user") ||path.toLowerCase().contains("profile") || path.toLowerCase().contains("poi")||path.toLowerCase().contains("visitors")||path.toLowerCase().contains("formc")|| path.toLowerCase().contains("_small"))
        {
            defaultFileName = new FileManagementService().getApplicationPath() + "default.png";
        }

        else{
            defaultFileName = new FileManagementService().getApplicationPath() + "default.jpg";
        }


        def fileLocation = new FileManagementService().getApplicationPath() + path
        File requestedFile = new File(fileLocation);

        if (requestedFile.isDirectory()) {
            System.out.println("Requested for folder, instead of file");
            render(text: "No Such File.")
        } else {
            try {
                if (path.toLowerCase().contains(".jpg") || path.toLowerCase().contains(".png") || path.toLowerCase().contains(".jpeg"))
                {
                    if (requestedFile.exists()) {
                        render(file: requestedFile, contentType: getServletContext().getMimeType(requestedFile.getName()))
                    } else {
                        File defaultFile = new File(defaultFileName);
                        render(file: defaultFile, contentType: getServletContext().getMimeType(defaultFileName))
                    }
                }
                else if (path.toLowerCase().contains(".mp4") ||
                        path.toLowerCase().contains(".avi") ||
                        path.toLowerCase().contains(".docx") ||
                        path.toLowerCase().contains(".jpeg") ||
                        path.toLowerCase().contains(".mp3") ||
                        path.toLowerCase().contains(".png") ||
                        path.toLowerCase().contains(".pdf") ||
                        path.toLowerCase().contains(".csv") ||
                        path.toLowerCase().contains(".xlsv") ||
                        path.toLowerCase().contains(".mov") ||
                        path.toLowerCase().contains(".mkv") ||
                        path.toLowerCase().contains(".webm") ||
                        path.toLowerCase().contains(".flv") ||
                        path.toLowerCase().contains(".wmv") ||
                        path.toLowerCase().contains(".mpg") ||
                        path.toLowerCase().contains(".mpeg") ||
                        path.toLowerCase().contains(".3gp") ||
                        path.toLowerCase().contains(".ts") ||
                        path.toLowerCase().contains(".ogv") ||
                        path.toLowerCase().contains(".rm") ||
                        path.toLowerCase().contains(".rmvb") ||
                        path.toLowerCase().contains(".dat") ||
                        path.toLowerCase().contains(".mts") ||
                        path.toLowerCase().contains(".vob") ||
                        path.toLowerCase().contains(".svi") ||
                        path.toLowerCase().contains(".xvid") ||
                        path.toLowerCase().contains(".divx") ||
                        path.toLowerCase().contains(".asf") ||
                        path.toLowerCase().contains(".amv") ||
                        path.toLowerCase().contains(".h264") ||
                        path.toLowerCase().contains(".h265") ||
                        path.toLowerCase().contains(".m4v") ||
                        path.toLowerCase().contains(".m2ts") ||
                        path.toLowerCase().contains(".wmv") || // Repeated for completeness
                        path.toLowerCase().contains(".bik") || // Bink video
                        path.toLowerCase().contains(".drc") || // Dynamic Range Compression video
                        path.toLowerCase().contains(".f4v") || // Flash Video
                        path.toLowerCase().contains(".mkv") || // Repeated for completeness
                        path.toLowerCase().contains(".nsv") || // Nullsoft Streaming Video
                        path.toLowerCase().contains(".ogm") || // Ogg Media
                        path.toLowerCase().contains(".qt") || // QuickTime movie
                        path.toLowerCase().contains(".tp") || // MPEG transport stream
                        path.toLowerCase().contains(".trp") || // MPEG transport stream
                        path.toLowerCase().contains(".vob") || // Repeated for completeness
                        path.toLowerCase().contains(".x264") || // H.264 video encoded in .x264
                        path.toLowerCase().contains(".x265")) // H.265 video encoded in .x265
                {
                    if (requestedFile.exists()) {
                        render(file: requestedFile, contentType: getServletContext().getMimeType(requestedFile.getName()))
                    } else {
                        File defaultFile = new File(defaultFileName);
                        // println("File controller: Default path taken... since file " + requestedFile.absolutePath + " doesn't exist.")
                        render(file: defaultFile, contentType: getServletContext().getMimeType(defaultFileName))
                    }
                }
                else if (path.toLowerCase().substring(path.length() - 2, path.length()).equals("na")) {
                    System.out.println("File Does not exists");
                    File defaultFile = new File(defaultFileName);
                    render(file: defaultFile, contentType: getServletContext().getMimeType(defaultFileName))
                }
                else {
                    if (requestedFile.exists()) {
                        render(file: requestedFile, contentType: getServletContext().getMimeType(requestedFile.getName()))
                    }
                    else {
                        File defaultFile = new File(defaultFileName);
//                        println("File controller: Default path taken... since file " + requestedFile.absolutePath + " doesn't exist.")
                        render(file: defaultFile, contentType: getServletContext().getMimeType(defaultFileName))
                    }
                }
            }
            catch (ClientAbortException cl) {
//                println("FileLocationController:FingerPrint: " + cl.message)
            }
            catch (ClientErrorException ce) {
//                println("FileLocationController:FingerPrint: " + ce.message)
            }
            catch (Exception ex) {
//                println("FileLocationController:FingerPrint: " + ex.message)
            }
        }
    }
}
