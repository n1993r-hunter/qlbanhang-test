package test;

import dal.DBConnection;
import java.sql.Connection;

public class TestConnection {
    public static void main(String[] args) {
        Connection con = DBConnection.getConnection();
        if (con != null) {
            System.out.println("✅ Kết nối SQL Server thành công!");
        } else {
            System.out.println("❌ Kết nối thất bại!");
        }
    }
}