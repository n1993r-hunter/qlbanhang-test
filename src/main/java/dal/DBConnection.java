package dal;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    // Đã thêm instanceName=SQLEXPRESS vào chuỗi kết nối
    private static final String URL = 
        "jdbc:sqlserver://localhost:1433;instanceName=SQLEXPRESS;databaseName=QLBanhang;integratedSecurity=true;encrypt=true;trustServerCertificate=true";

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(URL);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}