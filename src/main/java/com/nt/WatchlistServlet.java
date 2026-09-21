package com.nt;

import org.json.JSONObject;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/WatchlistServlet")
public class WatchlistServlet extends HttpServlet {
    private static final String ALPHA_VANTAGE_API_KEY = "VQ2QM0744XHJSX6G";
    private static final String API_URL = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "YOUR_DB_PASSWORD";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String type = request.getParameter("type");
        String symbol = request.getParameter("symbol");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "INSERT INTO watchlist (user_id, type, symbol) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userId);
            pstmt.setString(2, type);
            pstmt.setString(3, symbol);
            pstmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("WatchlistServlet?userId=" + userId);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        List<JSONObject> watchlistItems = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "SELECT * FROM watchlist WHERE user_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                JSONObject item = new JSONObject();
                item.put("type", rs.getString("type"));
                item.put("symbol", rs.getString("symbol"));

                JSONObject stockData = fetchStockData(rs.getString("symbol"));
                if (stockData != null) {
                    item.put("stockData", stockData);
                }
                watchlistItems.add(item);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("watchlistItems", watchlistItems);
        request.getRequestDispatcher("watchlist.jsp").forward(request, response);
    }

    private JSONObject fetchStockData(String symbol) {
        try {
            URL url = new URL(API_URL + symbol + "&apikey=YOUR_API_KEY");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONObject stockData = jsonResponse.optJSONObject("Global Quote");

            if (stockData != null) {
                JSONObject result = new JSONObject();
                result.put("price", stockData.optString("05. price", "N/A"));
                result.put("change", stockData.optString("09. change", "N/A"));
                return result;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}





