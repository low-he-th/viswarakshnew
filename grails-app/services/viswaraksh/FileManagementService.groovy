package viswaraksh

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile

import javax.imageio.ImageIO
import java.text.SimpleDateFormat

import static java.nio.file.Files.delete

@Transactional
class FileManagementService {

    /**
     * Function to get the Application Data Storage Directory on the File System.
     * Use this function everywhere in the project. Do not hardcode base path.
     * @return Path String of the application data storage directory
     */

    static String getApplicationPath()
    {
        return System.getProperty("user.home") + File.separator + Constants.MAIN_APPLICATION_FOLDER + File.separator

    }

    static String getConfigPath() {
        return System.getProperty("user.home") + File.separator + Constants.CONFIG_APPLICATION_FOLDER + File.separator
    }


}
