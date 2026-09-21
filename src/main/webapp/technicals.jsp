<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Technicals</title>
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
        <h1>Technicals Resources</h1>
    </header>

    <!-- Technicals Section -->
    <div class="section" id="technicals">
        <h2>Technicals</h2>
        <p>Explore various technical resources and tools for trading strategies, scanners, and technical analysis. Below are some useful links:</p>
        
        <p><a href="https://www.streak.tech/strategies" target="_blank">Streak Strategies</a> - A platform for creating, backtesting, and deploying your own stock strategies.</p>

        <p><a href="https://www.streak.tech/scanner/three-black-crows" target="_blank">Three Black Crows Scanner</a> - A scanner based on the "Three Black Crows" candlestick pattern.</p>

        <p><a href="https://www.streak.tech/scanner/extremely-bullish-daily-close" target="_blank">Extremely Bullish Daily Close Scanner</a> - A scanner for detecting extremely bullish daily close signals in stocks.</p>

        <p><a href="https://technicals.zerodha.com/symbol?id=TlNFX0tFSQ==" target="_blank">Technical Analysis - Zerodha</a> - A technical analysis tool from Zerodha to analyze stock market symbols and indicators.</p>
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
