<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Market</title>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }

        /* Sidebar */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #2C3E50;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }

        .sidebar ul { list-style: none; padding-left: 20px; }
        .sidebar ul li {
            padding: 15px;
            text-align: left;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            display: flex;
            align-items: center;
        }

        .sidebar ul li a i { margin-right: 10px; }
        .sidebar ul li:hover { background-color: #34495E; }

        /* Header */
        .header {
            position: fixed;
            top: 0;
            right: 0;
            width: calc(100% - 250px);
            height: 60px;
            background: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 24px;
            color: #2C3E50;
            font-weight: bold;
        }

        .header a {
            text-decoration: none;
            color: #2C3E50;
            font-size: 16px;
            font-weight: bold;
        }

        .header a:hover { color: #2980B9; }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            margin-top: 80px;
            text-align: center;
        }

        .dashboard {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }

        .dashboard .card {
            background-color: #ecf0f1;
            padding: 20px;
            width: 160px;
            height: 160px;
            margin: 20px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            cursor: pointer;
        }

        .dashboard .card:hover { transform: scale(1.1); }
        .dashboard .card i { font-size: 50px; margin-bottom: 10px; }
        .dashboard .card p { font-size: 18px; font-weight: bold; }

        /* Icon Colors */
        .dashboard .dashboard-card { background-color: #2980B9; color: white; }
        .dashboard .watchlist-card { background-color: #16A085; color: white; }
        .dashboard .stock-card { background-color: #F1C40F; color: white; }
        .dashboard .mf-card { background-color: #E67E22; color: white; }
        .dashboard .govt-card { background-color: #8E44AD; color: white; }
        
        .dashboard .ipo-card { background-color: #C0392B; color: white; }
        
        .dashboard .sip-card { background-color: #F39C12; color: white; }
        .dashboard .etf-card { background-color: #27AE60; color: white; }
        
        .dashboard .gsec-card { background-color: #2C3E50; color: white; }
        
        .dashboard .fundamentals-card { background-color: #9B59B6; color: white; }
        .dashboard .technicals-card { background-color: #34495E; color: white; }

    </style>

    <script>
        function navigateTo(page) {
            window.location.href = page;
        }
    </script>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li><a href="dashboard.jsp"><i class="fas fa-clock"></i> Dashboard</a></li>
            <li><a href="watchlist.jsp"><i class="fas fa-list-alt"></i> Watchlist</a></li>
            <!-- Stock card moved here -->
            <li><a href="stock.jsp"><i class="fas fa-chart-line"></i> Stock</a></li>
            <li><a href="mf.jsp"><i class="fas fa-chart-line"></i> Mutual Funds</a></li>
            
                       <li><a href="ipo.jsp"><i class="fas fa-cogs"></i> IPO</a></li>  
                    
            <li><a href="sip.jsp"><i class="fas fa-piggy-bank"></i> SIP</a></li>
            <li><a href="etf.jsp"><i class="fas fa-chart-pie"></i> ETF</a></li>
            
                   <li><a href="g_sec.jsp"><i class="fas fa-warehouse"></i> G-Sec</a></li>  
                
            <li><a href="fundamentals.jsp"><i class="fas fa-chart-bar"></i> Fundamentals</a></li>
            <li><a href="technicals.jsp"><i class="fas fa-tools"></i> Technicals</a></li>
        </ul>
    </div>

    <!-- Header -->
    <div class="header">
        <h1>Welcome to Stock Market Analysis</h1>
        <div>
              <a href="logout.jsp"><i class="fas fa-sign-in-alt"></i> logout</a> &nbsp;&nbsp;  
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard">
        
            <div class="card dashboard-card" onclick="navigateTo('dashboard.jsp')">
                <i class="fas fa-clock"></i>
                <p>Dashboard</p> 
            </div>
            <div class="card watchlist-card" onclick="navigateTo('watchlist.jsp')">
                <i class="fas fa-list-alt"></i>
                <p>Watchlist</p>
            </div>
            <!-- Stock card with Font Awesome icon -->
            <div class="card stock-card" onclick="navigateTo('stock.jsp')">
                <i class="fas fa-chart-line"></i> <!-- Stock icon -->
                <p>Stock</p>
            </div>
            <div class="card mf-card" onclick="navigateTo('mf.jsp')">
                <i class="fas fa-chart-line"></i>
                <p>Mutual Funds</p>
            </div>
            
            
            <div class="card ipo-card" onclick="navigateTo('ipo.jsp')">
                <i class="fas fa-cogs"></i>
                <p>IPO</p>
            </div>
            
            
            <div class="card sip-card" onclick="navigateTo('sip.jsp')">
                <i class="fas fa-piggy-bank"></i>
                <p>SIP</p>
            </div>
            <div class="card etf-card" onclick="navigateTo('etf.jsp')">
                <i class="fas fa-chart-pie"></i>
                <p>ETF</p>
            </div>
            
            
            <div class="card gsec-card" onclick="navigateTo('g_sec.jsp')">
                <i class="fas fa-warehouse"></i>
                <p>G-Sec</p>
            </div>  
            
            
            <div class="card fundamentals-card" onclick="navigateTo('fundamentals.jsp')">
                <i class="fas fa-chart-bar"></i>
                <p>Fundamentals</p>
            </div>
            <div class="card technicals-card" onclick="navigateTo('technicals.jsp')">
                <i class="fas fa-tools"></i>
                <p>Technicals</p>
            </div>
        </div>
    </div>

</body>
</html>
