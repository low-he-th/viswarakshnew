package viswaraksh;

import org.grails.web.json.JSONObject;

import java.io.File;
import java.io.IOException;

public class Constants {

    public static String MAIN_APPLICATION_FOLDER = "viswaraksh";
    public static String CONFIG_APPLICATION_FOLDER = ".viswaraksh";
    public static String PRODUCT = "Product";

    public Constants(String configFile) {
        String path = System.getProperty("user.home") + File.separator + CONFIG_APPLICATION_FOLDER;
        File folder = new File(path);

        if (!folder.exists()) {
            folder.mkdirs();
        }

        try {
            JSONObject config = null;
            PRODUCT = config.get("PRODUCT").toString();
        } catch (Exception e) {
            e.printStackTrace(); // This will catch NullPointerException, etc.
        }
    }
}
