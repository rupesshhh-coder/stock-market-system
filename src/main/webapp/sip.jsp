<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create Stock SIP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 700px;
            margin-top: 50px;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .table-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Create a New Stock SIP</h2>
        
        <%-- Display success or error message after form submission --%>
        <% String message = request.getParameter("message"); %>
        <% if (message != null) { %>
            <div class="alert <%= message.contains("Successfully") ? "alert-success" : "alert-danger" %>">
                <%= message %>
            </div>
        <% } %>

        <form action="CreateSIPServlet" method="post">
            <div class="mb-3">
                <label for="sipName" class="form-label">SIP Name:</label>
                <input type="text" id="sipName" name="sipName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="stockSymbol" class="form-label">Stock Symbol:</label>
                <input type="text" id="stockSymbol" name="stockSymbol" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="investmentAmount" class="form-label">Investment Amount:</label>
                <input type="number" id="investmentAmount" name="investmentAmount" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="frequency" class="form-label">Frequency:</label>
                <select id="frequency" name="frequency" class="form-select" required>
                    <option value="daily">Daily</option>
                    <option value="weekly">Weekly</option>
                    <option value="monthly">Monthly</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="startDate" class="form-label">Start Date:</label>
                <input type="date" id="startDate" name="startDate" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Create SIP</button>
        </form>

        <%-- Display SIP Table --%>
        <div class="table-container">
            <h3 class="text-center mt-4">Existing SIPs</h3>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>SIP Name</th>
                        <th>Stock Symbol</th>
                        <th>Investment Amount</th>
                        <th>Frequency</th>
                        <th>Start Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Database connection details
                        String jdbcURL = "jdbc:mysql://localhost:3306/user_db";
                        String dbUser = "root";  // Change if necessary
                        String dbPassword = "1234";  // Change if necessary

                        try {
                            // Load MySQL JDBC Driver
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Establish connection
                            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                            // Query SIP records
                            String sql = "SELECT * FROM sip_details ORDER BY id DESC";
                            PreparedStatement stmt = conn.prepareStatement(sql);
                            ResultSet rs = stmt.executeQuery();

                            // Display records
                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("sip_name") %></td>
                            <td><%= rs.getString("stock_symbol") %></td>
                            <td>₹<%= rs.getDouble("investment_amount") %></td>
                            <td><%= rs.getString("frequency") %></td>
                            <td><%= rs.getDate("start_date") %></td>
                        </tr>
                    <%
                            }
                            // Close resources
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='6' class='text-center text-danger'>Database Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
   <!-- Back Button -->
<div class="text-center mt-4">
    <button class="btn btn-danger btn-lg d-flex align-items-center mx-auto gap-2" onclick="goBack()">
        <i class="fas fa-arrow-left"></i> Back
    </button>
</div>

<!-- JavaScript for Back Function -->
<script>
    function goBack() {
        window.history.back();
    }
</script>
   
    
    
    
</body>
</html>
