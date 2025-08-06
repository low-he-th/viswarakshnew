package viswaraksh;

import org.grails.web.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

public class Constants {

    public static String MAIN_APPLICATION_FOLDER = "viswaraksh";
    public static String CONFIG_APPLICATION_FOLDER = ".viswaraksh";
    public static String PRODUCT = "Product";
    public static String ADMIN_DEMO_USER = "";
    public static String DEMO_OTP = "";

    public Constants() {
        String path = System.getProperty("user.home") + File.separator + CONFIG_APPLICATION_FOLDER;
        File folder = new File(path);

        if (!folder.exists()) {
            folder.mkdirs();
        }

        try {
            String configFilePath = path + File.separator + "config.json";
            String configString = new String(Files.readAllBytes(Paths.get(configFilePath)));

            JSONObject config = new JSONObject(configString);
            if (config.has("ADMIN_DEMO_USER")) {
                ADMIN_DEMO_USER = config.get("ADMIN_DEMO_USER").toString();
            }

        } catch (Exception e) {
            System.err.println(Arrays.toString(e.getStackTrace()));
        }
    }
}
