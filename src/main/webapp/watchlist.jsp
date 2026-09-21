<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.JSONObject, java.util.List" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">




<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Stock Watchlist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
            margin-bottom: 20px;
        }
        input, button {
            padding: 10px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <h2>Stock Watchlist</h2>
    <form action="WatchlistServlet" method="post">
        <label for="userId">User ID:</label>
        <input type="number" name="userId" required>
        <label for="type">Type:</label>
        <input type="text" name="type" required>
        <label for="symbol">Symbol:</label>
        <input type="text" name="symbol" required>
        <button type="submit">Add to Watchlist</button>
    </form>
    <table>
        <tr>
            <th>Type</th>
            <th>Symbol</th>
            <th>Current Price</th>
            <th>Change</th>
        </tr>
        <% 
            List<JSONObject> watchlistItems = (List<JSONObject>) request.getAttribute("watchlistItems");
            if (watchlistItems != null) {
                for (JSONObject item : watchlistItems) {
                    JSONObject stockData = item.optJSONObject("stockData");
        %>
        <tr>
            <td><%= item.getString("type") %></td>
            <td><%= item.getString("symbol") %></td>
            <td><%= stockData != null ? stockData.optString("price", "N/A") : "N/A" %></td>
            <td><%= stockData != null ? stockData.optString("change", "N/A") : "N/A" %></td>
        </tr>
        <%
                }
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
