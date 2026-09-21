<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Market Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .card {
            border-radius: 10px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center text-white">Stock Market</h4>
        <a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="watchlist.jsp"><i class="fas fa-star"></i> Watchlist</a>
        <a href="mutualfunds.jsp"><i class="fas fa-chart-line"></i> Mutual Funds</a>
        <a href="stocks.jsp"><i class="fas fa-building"></i> Stocks</a>
        <a href="ipos.jsp"><i class="fas fa-briefcase"></i> IPOs</a>
        <a href="portfolio.jsp"><i class="fas fa-wallet"></i> Portfolio</a>
        <a href="orders.jsp"><i class="fas fa-shopping-cart"></i> Orders</a>
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Content -->
    <div class="content">
        <h2 class="mb-4">Dashboard</h2>

        <div class="row">
            <div class="col-md-4">
                <div class="card shadow-sm text-white bg-primary p-3">
                    <h5><i class="fas fa-chart-line"></i> Total Stocks</h5>
                    <h3>120</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm text-white bg-success p-3">
                    <h5><i class="fas fa-star"></i> Watchlist Items</h5>
                    <h3>15</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm text-white bg-warning p-3">
                    <h5><i class="fas fa-wallet"></i> Portfolio Value</h5>
                    <h3>$25,000</h3>
                </div>
            </div>
        </div>

        <div class="mt-4">
            <h4>Recent Transactions</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Stock</th>
                        <th>Type</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Apple Inc.</td>
                        <td>Buy</td>
                        <td>10</td>
                        <td>$150</td>
                        <td>2025-02-18</td>
                    </tr>
                    <tr>
                        <td>Google</td>
                        <td>Sell</td>
                        <td>5</td>
                        <td>$2,800</td>
                        <td>2025-02-17</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Start Investing Section -->
        <div class="mt-5 text-center">
            <h3>Start Investing Today!</h3>
            <p>Open a free Demat account with Zerodha and start investing in stocks, derivatives, mutual funds, ETFs, bonds, IPOs, and more.</p>
            <a href="https://zerodha.com/open-account?c=URE472" class="btn btn-primary btn-lg" target="_blank">
                Open Account with Zerodha
            </a>
        </div>
    </div>

    <!-- Bootstrap JS -->
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
