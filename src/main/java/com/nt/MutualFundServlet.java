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

@WebServlet("/MutualFundServlet")
public class MutualFundServlet extends HttpServlet {
    private static final String ALPHA_VANTAGE_API_KEY = "VQ2QM0744XHJSX6G";
    private static final String[] COMPANIES = {"AAPL", "GOOGL", "MSFT", "AMZN", "TSLA", "IBM", "META", "NFLX", "NVDA", "BABA"};

    private String getHistoricalData(String companyName) {
        String apiUrl = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=" + companyName.trim() + "&apikey=YOUR_API_KEY";
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
            System.out.println("API Response for " + companyName + ": " + response.toString()); // Debugging log
            return response.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\": \"Error fetching data for " + companyName + "\"}";
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> historicalDataList = new ArrayList<>();
        List<Map<String, String>> latestDataList = new ArrayList<>();

        for (String company : COMPANIES) {
            try {
                Thread.sleep(12000); // Prevent API rate limiting
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            String jsonData = getHistoricalData(company);
            try {
                JSONObject jsonObject = new JSONObject(jsonData);
                JSONObject timeSeries = jsonObject.getJSONObject("Time Series (Daily)");
                
                String latestDate = timeSeries.keys().next(); // Get most recent date
                JSONObject latestDayData = timeSeries.getJSONObject(latestDate);
                
                Map<String, String> latestMap = new HashMap<>();
                latestMap.put("company", company);
                latestMap.put("date", latestDate);
                latestMap.put("open", latestDayData.getString("1. open"));
                latestMap.put("high", latestDayData.getString("2. high"));
                latestMap.put("low", latestDayData.getString("3. low"));
                latestMap.put("close", latestDayData.getString("4. close"));
                latestMap.put("volume", latestDayData.getString("5. volume"));
                latestDataList.add(latestMap);
                
                for (String date : timeSeries.keySet()) {
                    JSONObject dayData = timeSeries.getJSONObject(date);
                    Map<String, String> dayMap = new HashMap<>();
                    dayMap.put("company", company);
                    dayMap.put("date", date);
                    dayMap.put("open", dayData.getString("1. open"));
                    dayMap.put("high", dayData.getString("2. high"));
                    dayMap.put("low", dayData.getString("3. low"));
                    dayMap.put("close", dayData.getString("4. close"));
                    dayMap.put("volume", dayData.getString("5. volume"));
                    historicalDataList.add(dayMap);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("latestDataList", latestDataList);
        request.setAttribute("historicalDataList", historicalDataList);
        request.getRequestDispatcher("mf.jsp").forward(request, response);
    }
}




