


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.Map" %>


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">





<html>
<head>
    <title>Upcoming IPOs</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Upcoming IPOs</h2>
    <table>
        <tr>
            <th>Company</th>
            <th>Issue Date</th>
            <th>Price Band</th>
            <th>Lot Size</th>
        </tr>
        <%
            List<Map<String, String>> ipoDataList = (List<Map<String, String>>) request.getAttribute("ipoDataList");
            if (ipoDataList != null && !ipoDataList.isEmpty()) {
                for (Map<String, String> ipo : ipoDataList) {
        %>
        <tr>
            <td><%= ipo.get("company") %></td>
            <td><%= ipo.get("issueOpen") %></td>
            <td><%= ipo.get("priceBand") %></td>
            <td><%= ipo.get("lotSize") %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="4" style="text-align:center;">No IPO data available</td></tr>
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


