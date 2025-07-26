import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;

public class DBUtil {
    private static final String PROPERTIES_FILE = "db.properties";
    private static String DB_URL;
    private static String DB_USER;
    private static String DB_PASSWORD;


    static {
        try {
            // Load DB credentials from the properties file
            Properties props = new Properties();
            FileInputStream fis = new FileInputStream(PROPERTIES_FILE);
            props.load(fis);

            DB_URL = props.getProperty("db.url");
            DB_USER = props.getProperty("db.user");
            DB_PASSWORD = props.getProperty("db.password");

            // This ensures the MySQL JDBC driver is registered
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}