package viswaraksh


import javax.crypto.SecretKeyFactory
import javax.crypto.spec.PBEKeySpec
import javax.ws.rs.client.Client
import javax.ws.rs.client.ClientBuilder
import javax.ws.rs.client.Entity
import javax.ws.rs.core.Form
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response
import javax.xml.bind.DatatypeConverter
import java.security.NoSuchAlgorithmException
import java.security.SecureRandom
import java.security.spec.InvalidKeySpecException

/**
 * Service class for authentication services
 **/
class AuthService
{
    private static final Random RANDOM = new SecureRandom();
    private static final int ITERATIONS = 10000;
    private static final int KEY_LENGTH = 256;
    /**
     * Returns a random salt to be used to hash a password.
     *
     * @return a 16 bytes random salt
     */
    public static String getNextSalt()
    {
        byte[] salt = new byte[16];
        RANDOM.nextBytes(salt);
        return salt;
    }

    /**
     * Returns a salted and hashed password using the provided hash.<br>
     * Note - side effect: the password is destroyed (the char[] is filled with zeros)
     *
     * @param password the password to be hashed
     * @param salt a 16 bytes salt, ideally obtained with the getNextSalt method
     * @return the hashed password with a pinch of salt
     */
    public static byte[] hash(char[] password, byte[] salt)
    {
        PBEKeySpec spec = new PBEKeySpec(password, salt, ITERATIONS, KEY_LENGTH);
        Arrays.fill(password, Character.MIN_VALUE);
        try
        {
            SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            return skf.generateSecret(spec).getEncoded();
        }
        catch (NoSuchAlgorithmException | InvalidKeySpecException e)
        {
            throw new AssertionError("Error while hashing a password: " + e.getMessage(), e);
        }
        finally
        {
            spec.clearPassword();
        }
    }

    public static String toHexString(byte[] array)
    {
        return DatatypeConverter.printHexBinary(array);
    }

    def static byte[] toByteArray(String s)
    {
        return DatatypeConverter.parseHexBinary(s);
    }

    public static String hashPassword(String rawPassword)
    {
        //set user salt
        byte[] salt = getNextSalt()
        String password1 = toHexString(hash(rawPassword.toCharArray(), salt))
        //replace original password with hashed password in client request
        return password1 + "_" + toHexString(salt)
    }

    public static String getSalt(Boolean isBytes = false)
    {
        byte[] salt = getNextSalt()
        if (isBytes)
        {
            return salt
        }
        else
        {
            return toHexString(salt)
        }
    }

    public static String sendOTPviaSMS(String mobile)
    {
        int status = 400 // Default status value
        String otp
        try
        {
            Otp otpStore = Otp.findByMobile(mobile)
            if (mobile.equalsIgnoreCase(new Constants(new FileManagementService().getIamConfigFile()).ADMIN_DEMO_USER.toString()) ||mobile.equalsIgnoreCase(new Constants(new FileManagementService().getIamConfigFile()).USER_DEMO_USER.toString()) || mobile.equalsIgnoreCase(new Constants(new FileManagementService().getIamConfigFile()).SUPERADMIN_DEMO_USER.toString()) /*|| mobile.equalsIgnoreCase(new UserConstants().SAFECONNECT_DEMO_USER.toString()) || mobile.equalsIgnoreCase(new UserConstants().SAFECONNECT_DEMO_USER_ONE.toString()) || mobile.equalsIgnoreCase(new UserConstants().SAFECONNECT_DEMO_USER_TWO.toString()) || mobile.equalsIgnoreCase(new UserConstants().SAFECONNECT_DEMO_USER_THREE.toString()) || mobile.equalsIgnoreCase(new UserConstants().SAFECONNECT_DEMO_USER_FOUR.toString())*/)
            {
                otp = new Constants(new FileManagementService().getIamConfigFile()).SUPERADMIN_DEMO_OTP.toString()
            }
            else
            {
                otp = generateOTP(5)
            }

            if (!otpStore)
            {
                otpStore = new Otp()
                otpStore.mobile = mobile
            }

            if (otp != null && otp != "")
            {
                otpStore.webOtp = otp
                otpStore.setIsUpdatable(true)
                Otp addedOtp = otpStore.save(flush: true)
                if (addedOtp != null)
                {
                    SMSTemplate smsTemplate = SMSTemplate.findByName("OTP")
                    String message = smsTemplate.template
                    message = message.replace("\$otp", addedOtp.webOtp)

                    def smsGatewayResponse = null
                    if (mobile != null && !mobile.equalsIgnoreCase(new Constants(new FileManagementService().getIamConfigFile()).ADMIN_DEMO_USER.toString()) && !mobile.equalsIgnoreCase(new Constants(new FileManagementService().getIamConfigFile()).SUPERADMIN_DEMO_USER.toString()) )
                    {
                        try
                        {
                            String twoFactorConf = Config.findByName("TWO_FACTOR_CONFIG").value
                            String twoFactor = Config.findByName("TWO_FACTOR_SMS").value
                            if (twoFactor == 'true')
                            {
                                smsGatewayResponse =sendOTPMessage(addedOtp.mobile, addedOtp.webOtp, twoFactorConf)

//                                smsGatewayResponse = sendOTPMessage(addedOtp.mobile, message, addedOtp.webOtp, twoFactorConf)
                            }
                            else
                            {
                                smsGatewayResponse = sendSingleOTPSMS(addedOtp.mobile, message, smsTemplate.templateId)
                            }

                            if (smsGatewayResponse != null)
                            {
                                status = smsGatewayResponse.status
                            }
                        }
                        catch (Exception ex)
                        {
                            println(ex.stackTrace)
                            println(ex.message)
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            println(ex.stackTrace)
            println(ex.message)
        }


        User user = User.findByMobile(mobile)
        if (!user.isPasswordBasedLogin)
        {
            Auth auth = Auth.findByMobile(mobile)
            auth.webPassword = new AuthService().hashPassword(otp)
            auth.isUpdatable = true
            Auth updatedAuth = auth.save(flush: true)

        }
        return status // Returning status
    }

    public static String generateOTP(Integer len)
    {
        String values = "0123456789"
        def ran = new Random()

        String password = ""

        for (int i = 0; i < len; i++)
        {
            password = password + values.charAt(ran.nextInt(values.length()))

        }
        return password;
//        return (10000 + ran.nextInt(90000)).toString()
    }



    static Response sendOTPMessage(String mobile, String message, String twoFactor) {
        SMSLog smsLog = new SMSLog()
        if (mobile?.trim() && message?.trim() && twoFactor?.trim()) {
            String encodedMessage = URLEncoder.encode(message, "UTF-8")
            String encodedTwoFactor = URLEncoder.encode(twoFactor, "UTF-8")
            String url = "https://2factor.in/API/V1/597b06b4-2691-11e8-a895-0200cd936042/SMS/${mobile}/${encodedMessage}/${encodedTwoFactor}"

            Client client = ClientBuilder.newClient()
            Response apiResponse = client.target(url).request().get()
            client.close()

            if (apiResponse.status == 200) {
                smsLog.status = true
                smsLog.details = 'OTP sent to ' + mobile
                println('OTP is: ' + message)
            } else {
                smsLog.status = false
                smsLog.details = 'OTP not sent to ' + mobile
            }
            smsLog.mobile = mobile
            smsLog.date = new Date()
            SMSLog savedLog = smsLog.save(flush: true)
            println(savedLog)

            return apiResponse
        }

        println("Available SMS is empty")
        return null
    }

    public static String sendSingleOTPSMS(String mobileNo, String message, String templateId)
    {
        Form form = new Form();
        form.param("From", "CAPTEC")
        form.param("To", mobileNo)
        form.param("Msg", message)

        String url = "https://2factor.in/API/V1/597b06b4-2691-11e8-a895-0200cd936042/ADDON_SERVICES/SEND/TSMS"
        Client client = ClientBuilder.newClient()
        Response apiResponse = client.target(url)
                .request(MediaType.APPLICATION_FORM_URLENCODED)
                .post(Entity.entity(form, MediaType.APPLICATION_FORM_URLENCODED_TYPE))

        if (apiResponse.status == 200)
        {
            return apiResponse
        }
        return null
    }
}
