package com.nt;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/navigate")
public class NavigationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the 'page' parameter from the request
        String page = request.getParameter("page");
        String sub = request.getParameter("sub");


        // Optional: Check for a user session (authentication)
        HttpSession session = request.getSession(false);

        // If no session or user is not logged in, redirect to login or home page
        if (session == null || session.getAttribute("user") == null) {
            // User is not logged in, redirect to login page or home page
            response.sendRedirect("jsp/header.jsp");  // Assume a login page exists
            return;  // Stop further execution
        }

        // Routing logic based on the 'page' parameter
        if (page != null) {
            switch (page) {
                case "home":
                    // Forward to the home page (header.jsp or another appropriate page)
                    request.getRequestDispatcher("jsp/header.jsp").forward(request, response);
                    break;
                case "orders":
                    // Forward to the orders page
                    request.getRequestDispatcher("jsp/orders.jsp").forward(request, response);
                    break;
                case "com.nt.SignUpServlet":
                    // Forward to the orders page
                    request.getRequestDispatcher("jsp/signup.jsp").forward(request, response);
                    break;
                case "watchlist":
                    // Forward to the watchlist page
                   // request.getRequestDispatcher("jsp/watchlist.jsp").forward(request, response);
                	 if ("mf".equals(sub)) {
                         request.getRequestDispatcher("jsp/watchlist.jsp").forward(request, response); // Forward to watchlist.jsp for MF
                     } else {
                         response.sendRedirect("jsp/header.jsp"); // Redirect to default page for other cases
                     }
                     break;
               // Add more cases for other pages as needed
                default:
                    // If the page parameter is invalid, redirect to a default page (header.jsp)
                    response.sendRedirect("jsp/header.jsp");
                    break;
            }
        } else {
            // If the 'page' parameter is not provided, redirect to the default page (header.jsp)
            response.sendRedirect("jsp/header.jsp");
        }
    }
}



