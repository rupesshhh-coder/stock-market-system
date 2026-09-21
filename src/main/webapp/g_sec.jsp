

<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">



<html>
<head>
    <title>Government Securities</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }
        h2 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 8px;
            width: 250px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .no-data {
            text-align: center;
            color: #888;
            padding: 20px;
        }
    </style>
</head>
<body>
    <h2>Search Government Securities</h2>
    <form action="GovernmentSecurityServlet" method="get">
        <input type="text" name="search" placeholder="Enter security name">
        <input type="submit" value="Search">
    </form>

    <h3>Search Results</h3>
    <table>
        <tr>
            <th>Security Name</th>
            <th>Issue Date</th>
            <th>Maturity Date</th>
            <th>Interest Rate</th>
        </tr>
        <%
            // Sample JSON data
            String sampleData = "["
                + "{\"security_name\": \"10-Year Treasury Note\", \"issue_date\": \"2024-01-15\", \"maturity_date\": \"2034-01-15\", \"interest_rate\": \"3.50%\"},"
                + "{\"security_name\": \"20-Year Treasury Bond\", \"issue_date\": \"2023-05-01\", \"maturity_date\": \"2043-05-01\", \"interest_rate\": \"4.00%\"},"
                + "{\"security_name\": \"5-Year Treasury Note\", \"issue_date\": \"2022-11-10\", \"maturity_date\": \"2027-11-10\", \"interest_rate\": \"2.75%\"}"
                + "]";

            // Parse the sample data
            JSONArray jsonArray = new JSONArray(sampleData);

            if (jsonArray.length() > 0) {
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject security = jsonArray.getJSONObject(i);
        %>
        <tr>
            <td><%= security.getString("security_name") %></td>
            <td><%= security.getString("issue_date") %></td>
            <td><%= security.getString("maturity_date") %></td>
            <td><%= security.getString("interest_rate") %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4" class="no-data">No data available</td>
        </tr>
        <%
            }
        %>
    </table>
    
    
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



