package com.nt;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Ideally, hash this in a real application
        String email = request.getParameter("email");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Load MySQL JDBC Driver explicitly
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Database Connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "YOUR_DB_PASSWORD");

            // SQL Query to Insert User Data
            String query = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password); // Ideally, store hashed passwords
            pst.setString(3, email);

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                out.println("<h3>Registration Successful! <a href='login.jsp'>Login here</a></h3>");
            } else {
                out.println("<h3>Registration Failed. Please try again.</h3>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<h3>Error: MySQL JDBC Driver not found.</h3>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


