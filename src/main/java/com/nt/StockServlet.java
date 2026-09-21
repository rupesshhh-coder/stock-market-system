package com.nt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/StockServlet")
public class StockServlet extends HttpServlet {
    private static final String ALPHA_VANTAGE_API_KEY = "VQ2QM0744XHJSX6G";
    private static final String[] STOCKS = {"AAPL", "GOOGL", "MSFT", "AMZN", "TSLA", "IBM", "META", "NFLX", "NVDA", "BABA"};

    private String getStockData(String stockSymbol) {
        String apiUrl = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=" + stockSymbol.trim() + "&apikey=YOUR_API_KEY";
        StringBuilder response = new StringBuilder();
        
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");
            
            try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
            }
            System.out.println("API Response for " + stockSymbol + ": " + response.toString()); // Debugging log
            return response.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\": \"Error fetching data for " + stockSymbol + "\"}";
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> stockDataList = new ArrayList<>();

        for (String stock : STOCKS) {
            try {
                Thread.sleep(12000); // Prevent API rate limiting
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            String jsonData = getStockData(stock);
            try {
                JSONObject jsonObject = new JSONObject(jsonData);
                JSONObject timeSeries = jsonObject.getJSONObject("Time Series (Daily)");
                
                for (String date : timeSeries.keySet()) {
                    JSONObject dayData = timeSeries.getJSONObject(date);
                    Map<String, String> dayMap = new HashMap<>();
                    dayMap.put("stock", stock);
                    dayMap.put("date", date);
                    dayMap.put("open", dayData.getString("1. open"));
                    dayMap.put("high", dayData.getString("2. high"));
                    dayMap.put("low", dayData.getString("3. low"));
                    dayMap.put("close", dayData.getString("4. close"));
                    dayMap.put("volume", dayData.getString("5. volume"));
                    stockDataList.add(dayMap);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("stockDataList", stockDataList);
        request.getRequestDispatcher("stock.jsp").forward(request, response);
    }
}




