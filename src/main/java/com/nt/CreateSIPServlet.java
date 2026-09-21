package com.nt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateSIPServlet")
public class CreateSIPServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/user_db";
    private static final String DB_USER = "root";  // Change if needed
    private static final String DB_PASSWORD = "YOUR_DB_PASSWORD";  // Change if needed

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String sipName = request.getParameter("sipName");
        String stockSymbol = request.getParameter("stockSymbol");
        String investmentAmount = request.getParameter("investmentAmount");
        String frequency = request.getParameter("frequency");
        String startDate = request.getParameter("startDate");

        // Validate inputs
        if (sipName.isEmpty() || stockSymbol.isEmpty() || investmentAmount.isEmpty() || frequency.isEmpty() || startDate.isEmpty()) {
            response.sendRedirect("sip.jsp?message=All fields are required!");
            return;
        }

        // Convert investmentAmount to a numerical value
        double amount;
        try {
            amount = Double.parseDouble(investmentAmount);
        } catch (NumberFormatException e) {
            response.sendRedirect("sip.jsp?message=Invalid investment amount!");
            return;
        }

        // Database connection and insertion
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // Insert SIP details into the database
            String sql = "INSERT INTO sip_details (sip_name, stock_symbol, investment_amount, frequency, start_date) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, sipName);
            stmt.setString(2, stockSymbol);
            stmt.setDouble(3, amount);
            stmt.setString(4, frequency);
            stmt.setString(5, startDate);

            int rowsInserted = stmt.executeUpdate();

            // Close resources
            stmt.close();
            conn.close();

            // Redirect to sip.jsp with success message
            if (rowsInserted > 0) {
                response.sendRedirect("sip.jsp?message=SIP Created Successfully!");
            } else {
                response.sendRedirect("sip.jsp?message=Failed to create SIP.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("sip.jsp?message=Database Error: " + e.getMessage());
        }
    }
}



