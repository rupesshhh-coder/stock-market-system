package com.nt;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Database Connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", "root", "YOUR_DB_PASSWORD");

            // Query to check user credentials
            String query = "SELECT * FROM users WHERE username=? AND password=?";
            pst = con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);

            rs = pst.executeQuery();

            if (rs.next()) {
                // Login successful, create a session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("combined.jsp"); // Redirect to Dashboard
            } else {
                out.println("<h3>Invalid username or password. <a href='login.jsp'>Try again</a></h3>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<h3>Error: MySQL JDBC Driver not found.</h3>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


