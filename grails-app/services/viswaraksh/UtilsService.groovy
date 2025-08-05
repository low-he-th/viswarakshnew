package viswaraksh

import grails.gorm.transactions.Transactional

import org.springframework.web.multipart.MultipartFile

//import org.jodconverter.local.office.LocalOfficeManager

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import java.text.SimpleDateFormat
import java.util.regex.Matcher
import java.util.regex.Pattern

/**
 * Service class for user utility services
 **/
@Transactional
class UtilsService {







    public static String uploadImage(String folderName, String imageName, MultipartFile imageFile) {
        String name = "NA"
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS")
//        String date = sdf.format(new Date())
        String date =  new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + String.format("%09d", System.nanoTime() % 1_000_000_000)

        if (imageFile != null && imageFile.size > 0) { // Allow all file types
            String originalFilename = imageFile.getOriginalFilename()
            String fileExtension = ""

            if (originalFilename.contains(".")) {
                fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."))
            }

            // Generate file name if not provided
            if ((imageName == null) || (imageName.equalsIgnoreCase("NA"))) {
                name = date + fileExtension
            } else {
                name =  date + fileExtension
            }

            // Define the file storage path
            String uploadedFileLocation = new FileManagementService().getApplicationPath() +

                    folderName + File.separator + name

            File objFile = new File(uploadedFileLocation)
            objFile.mkdirs()

            if (objFile.exists()) {
                objFile.delete()
            }

            // Save the file
            InputStream ios = imageFile.getInputStream()
            new FileOutputStream(uploadedFileLocation).leftShift(ios).close()
            ios.close()

            return name
        }

        return name
    }


    /**
     * Method to generate random 5 digit OTP to login
     * @return int generated OTP
     */
    public static String generateOTP() {
        def ran = new Random()
        return (10000 + ran.nextInt(90000)).toString()
    }




    public static boolean isPermitted(String featureName, String permittedFeaturesString) {
        if (permittedFeaturesString != null) {
            String[] permissions = permittedFeaturesString.split(",")
            ArrayList<String> permittedFeatureIds = new ArrayList<>()
            for (String permission : permissions) {
//                permittedFeatureIds.add(Long.parseLong(permission))
                permittedFeatureIds.add(permission)
            }
//            ArrayList<String> permittedFeatures = Permission.findAllByIdInList(permittedFeatureIds).name
            if (permittedFeatureIds.contains(featureName)) {
                return true
            }
        }
        return false
    }





    /**
     * Get user details from the request header
     * @param authToken , request header
     * @return User
     */
    public static def getUserByHeaderInfo(String authToken) {
        def user = null

        if (authToken != null && authToken.size() > 0) {
            if ((authToken == null)) {
                return user

            }
            authToken = authToken.replaceFirst('Basic ', "");
            String decodedString = Base64.decodeAsString(authToken);
            StringTokenizer stringTokenizer = new StringTokenizer(decodedString, ":");
            Auth auth = new Auth();
            if (stringTokenizer.hasMoreTokens()) {
                String userName = stringTokenizer.nextToken();
                auth.setUsername(userName);
            }
            if (stringTokenizer.hasMoreTokens()) {
                String password = stringTokenizer.nextToken();
                password = password.split('-')[0]
                auth.setMobilePassword(password);
            }

            Auth validAuth = Auth.findByUsername(auth.username)
            if (validAuth == null) {
                return user
            }
            //get user salt from webAuth table
            byte[] salt = new AuthService().toByteArray(validAuth.getWebPassword().split("_")[1]);
            //hash the mobilePassword sent from client
            String password1 = new AuthService().toHexString(new AuthService().hash(auth.password.toCharArray(), salt));
            //replace original mobilePassword with hashed mobilePassword in client request
            auth.setMobilePassword(password1 + "_" + validAuth.getMobilePassword().split("_")[1]);
            if (Auth.findByUsernameAndMobilePassword(auth.username, auth.mobilepassword)) {
                user = User.findByMobile(auth.username)
                if (user) {
                    return user
                }
            }
            return user

        }
    }



}
