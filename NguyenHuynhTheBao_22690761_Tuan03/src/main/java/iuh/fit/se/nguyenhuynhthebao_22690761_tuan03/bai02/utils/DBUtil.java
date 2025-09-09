package iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.bai02.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mariadb://localhost:3306/bao22690761";
    private static final String USER = "root"; // thay bằng user của bạn
    private static final String PASSWORD = "sapassword"; // thay bằng pass của bạn

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.mariadb.jdbc.Driver"); // MariaDB driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
