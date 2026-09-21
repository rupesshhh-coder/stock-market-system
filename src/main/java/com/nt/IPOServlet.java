
package com.nt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/IPOServlet")
public class IPOServlet extends HttpServlet {
    private static final String IPO_API_URL = "https://api.polygon.io/v3/reference/ipos?apiKey=YOUR_POLYGON_API_KEY"; 

    private List<Map<String, String>> getIPOData() {
        List<Map<String, String>> ipoList = new ArrayList<>();
        try {
            URL url = new URL(IPO_API_URL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");

            StringBuilder response = new StringBuilder();
            try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
            }

            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONArray ipoArray = jsonResponse.optJSONArray("results"); 

            if (ipoArray != null) {
                for (int i = 0; i < ipoArray.length(); i++) {
                    JSONObject ipoObject = ipoArray.getJSONObject(i);
                    Map<String, String> ipoData = new HashMap<>();
                    ipoData.put("company", ipoObject.optString("name"));
                    ipoData.put("issueOpen", ipoObject.optString("offeringDate"));
                    ipoData.put("priceBand", ipoObject.optString("priceRange"));
                    ipoData.put("lotSize", ipoObject.optString("shareCount"));
                    ipoList.add(ipoData);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ipoList;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> ipoDataList = getIPOData();
        request.setAttribute("ipoDataList", ipoDataList);
        request.getRequestDispatcher("ipo.jsp").forward(request, response);
    }
}



