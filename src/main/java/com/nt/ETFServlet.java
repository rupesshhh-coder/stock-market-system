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

@WebServlet("/ETFServlet")
public class ETFServlet extends HttpServlet {
    private static final String ALPHA_VANTAGE_API_KEY = "VQ2QM0744XHJSX6G"; // Your existing API key
    private static final String[] ETFS = {"SPY", "VOO", "QQQ", "DIA", "IWM"}; // List of ETF symbols

    private String getHistoricalData(String etfSymbol) {
        String apiUrl = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=" + etfSymbol.trim() + "&apikey=YOUR_API_KEY";
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
            return response.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\": \"Error fetching data for " + etfSymbol + "\"}";
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> historicalDataList = new ArrayList<>();

        for (String etf : ETFS) {
            try {
                Thread.sleep(12000); // Prevent API rate limiting
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            String jsonData = getHistoricalData(etf);
            try {
                JSONObject jsonObject = new JSONObject(jsonData);
                JSONObject timeSeries = jsonObject.getJSONObject("Time Series (Daily)");

                for (String date : timeSeries.keySet()) {
                    JSONObject dayData = timeSeries.getJSONObject(date);
                    Map<String, String> dayMap = new HashMap<>();
                    dayMap.put("etf", etf);
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

        request.setAttribute("historicalDataList", historicalDataList);
        request.getRequestDispatcher("etf.jsp").forward(request, response);
    }
}




