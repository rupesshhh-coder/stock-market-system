package com.nt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UserDAO {

    public static boolean registerUser(String username, String password, String email) {
        boolean status = false;
        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "YOUR_DB_PASSWORD");

            String query = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, email);

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return status;
    }
}


