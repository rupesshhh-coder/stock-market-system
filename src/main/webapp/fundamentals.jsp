<!DOCTYPE html>
<html lang="en">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">




<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fundamentals</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Header Styles */
        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        /* Section Container Styles */
        .section {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin: 20px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .section h2 {
            color: #2c3e50;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .section p {
            font-size: 16px;
            color: #34495e;
            line-height: 1.6;
        }

        /* Link Styles */
        .section a {
            color: #3498db;
            font-size: 18px;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #3498db;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
            margin-right: 10px;
            margin-bottom: 10px;
        }

        .section a:hover {
            background-color: #3498db;
            color: white;
            border-color: #2980b9;
        }

        /* Footer Styles */
        footer {
            text-align: center;
            padding: 10px;
            background-color: #2c3e50;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>Fundamentals Resources</h1>
    </header>

    <!-- Fundamentals Section -->
    <div class="section" id="fundamentals">
        <h2>Fundamentals</h2>
        <p>Explore the various fundamental analysis resources and investment portfolios. Below are some links to useful information:</p>
        
        <p><a href="https://www.tijorifinance.com/company/larsen-toubro-infotech/" target="_blank">Larsen & Toubro Infotech</a></p>
        <p><a href="https://www.tijorifinance.com/company/larsen-toubro-infotech/#revenuemix" target="_blank">Revenue Mix - Larsen & Toubro</a></p>
        <p><a href="https://www.tijorifinance.com/company/larsen-toubro-infotech/financials/#quarterly_results" target="_blank">Quarterly Results - L&T Infotech</a></p>
        <p><a href="https://www.tijorifinance.com/company/larsen-toubro-infotech/benchmarking/" target="_blank">Benchmarking - L&T Infotech</a></p>
        <p><a href="https://www.smallcase.com/smallcase/equity-and-gold-SCET_0005" target="_blank">Equity and Gold Portfolio</a></p>
        <p><a href="https://www.smallcase.com/smallcase/timeless-asset-allocation-SCAW_0001" target="_blank">Timeless Asset Allocation</a></p>
        <p><a href="https://www.smallcase.com/smallcase/retirement-2035-SCET_0017" target="_blank">Retirement 2035 Portfolio</a></p>
        <p><a href="https://www.smallcase.com/smallcase/top-100-stocks-SCET_0004" target="_blank">Top 100 Stocks</a></p>
        <p><a href="https://www.smallcase.com/smallcase/the-naked-trader-SCMO_0016" target="_blank">The Naked Trader Portfolio</a></p>
        <p><a href="https://www.smallcase.com/smallcase/super-multipliers-PTDMO_0005" target="_blank">Super Multipliers Portfolio</a></p>
        <p><a href="https://www.smallcase.com/smallcase/green-energy-portfolio-NIVTR_0001" target="_blank">Green Energy Portfolio</a></p>
        <p><a href="https://www.smallcase.com/smallcase/concentrated-momentum-WRTMO_0018" target="_blank">Concentrated Momentum Portfolio</a></p>
        <p><a href="https://www.smallcase.com/smallcase/top-250-stocks-SCET_0015" target="_blank">Top 250 Stocks</a></p>
    </div>

    <!-- Government Securities Section -->
    <div class="section" id="government-securities">
        <h2>Government Securities</h2>
        <p>Stay informed about upcoming auctions for various government securities:</p>
        <p><a href="https://support.zerodha.com/category/trading-and-markets/general-kite/govt-securities/articles/upcoming-auction-schedule" target="_blank">Upcoming Auction Schedule</a></p>
    </div>

    <!-- SIP Section -->
    <div class="section" id="sip">
        <h2>Stock SIP</h2>
        <p>Learn more about Stock SIP (Systematic Investment Plan) and how to set up SIP orders in Kite:</p>
        <p><a href="https://support.zerodha.com/category/trading-and-markets/charts-and-orders/stock-sip/articles/kite-sip-order" target="_blank">Stock SIP Order Guide</a></p>
    </div>

    <!-- IPO Section -->
    <div class="section" id="ipo">
        <h2>IPO & Market Updates</h2>
        <p>Get the latest information on upcoming IPOs and market updates:</p>
        <p><a href="https://www.nseindia.com/market-data/all-upcoming-issues-ipo" target="_blank">All Upcoming IPOs</a></p>
    </div>

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
