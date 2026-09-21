<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mutual Funds</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 10px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            padding: 10px 15px;
            border: none;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1>Mutual Funds</h1>
    <form action="MutualFundServlet" method="get">
        <input type="text" name="search" placeholder="Search mutual funds...">
        <input type="submit" value="Search">
    </form>
    
    <h2>Historical Data</h2>
    <table>
        <tr>
            <th>Date</th>
            <th>Open</th>
            <th>High</th>
            <th>Low</th>
            <th>Close</th>
            <th>Volume</th>
        </tr>
        <c:forEach var="day" items="${historicalDataList}">
            <tr>
                <td>${day.date}</td>
                <td>${day.open}</td>
                <td>${day.high}</td>
                <td>${day.low}</td>
                <td>${day.close}</td>
                <td>${day.volume}</td>
            </tr>
        </c:forEach>
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
