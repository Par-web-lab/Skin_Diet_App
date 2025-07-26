import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    // Use your actual DB credentials here

    private static final String DB_URL = "jdbc:mysql://localhost:3306/Skin_Diet_Plan";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Parneet202406@";

    static {
        try {
            // Register MySQL JDBC driver (optional in recent versions but safe to keep)
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}