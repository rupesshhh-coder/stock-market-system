package com.nt;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;

public class StockDataFetcher {

    public JSONObject fetchStockData(String symbol) {
        String apiKey = "VQ2QM0744XHJSX6G"; // Replace with your Alpha Vantage API key
        String url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=" + symbol + "&apikey=YOUR_API_KEY";

        try {
            // Create URL object
            URL apiUrl = new URL(url);

            // Open HTTP connection
            HttpURLConnection conn = (HttpURLConnection) apiUrl.openConnection();
            conn.setRequestMethod("GET");

            // Read the response
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            // Close resources
            in.close();
            conn.disconnect();

            // Parse JSON response
            return new JSONObject(content.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Return null if there's an error
    }
}



