# 📈 Stock Market System

### 🎓 Final-Year Project

A web-based **Stock Market System** developed using **Java Servlets, JSP, MySQL, and external APIs**. The application provides stock market information, analysis features, and multiple investment-related modules through a simple web interface.

---

## 🚀 Features

* 🔐 User Registration & Login
* 📊 Stock Market Data
* ⭐ Personalized Watchlist
* 💰 Mutual Funds
* 💵 SIP Management
* 🏦 ETFs
* 📈 Fundamental Analysis
* 📉 Technical Analysis
* 🏷️ IPO Information
* 🌐 External API Integration
* 🗄️ MySQL Database Integration

---

## 🖥️ Project Screenshot

### 🏠 Dashboard

The dashboard provides easy access to the main features of the application, including **Watchlist, Stock Market, Mutual Funds, SIP, ETF, Fundamental Analysis, and Technical Analysis**.

<p align="center">
  <img src="screenshots/IMG-20250401-WA0005.jpg" alt="Stock Market System Dashboard" width="700">
</p>

> Additional project screenshots are available in the [screenshots](screenshots) folder.

---

## 🛠️ Technologies Used

| Technology      | Purpose               |
| --------------- | --------------------- |
| Java 8          | Backend Development   |
| Servlets        | Request Handling      |
| JSP             | Web Interface         |
| MySQL           | Database              |
| JDBC            | Database Connectivity |
| Maven           | Project Management    |
| Apache Tomcat   | Application Server    |
| Gson / org.json | JSON Processing       |
| Jsoup           | Web Data Processing   |

### APIs

* Alpha Vantage API
* Polygon API

---

## 📂 Project Structure

```text
StockMarket
│
├── src
│   └── main
│       ├── java
│       │   └── com.nt
│       │       ├── LoginServlet.java
│       │       ├── SignupServlet.java
│       │       ├── StockServlet.java
│       │       ├── StockDataFetcher.java
│       │       ├── WatchlistServlet.java
│       │       ├── ETFServlet.java
│       │       ├── MutualFundServlet.java
│       │       ├── IPOServlet.java
│       │       ├── CreateSIPServlet.java
│       │       └── GovernmentSecurityServlet.java
│       │
│       └── webapp
│           ├── dashboard.jsp
│           ├── stock.jsp
│           ├── technicals.jsp
│           ├── fundamentals.jsp
│           ├── watchlist.jsp
│           ├── etf.jsp
│           ├── mf.jsp
│           ├── ipo.jsp
│           ├── sip.jsp
│           └── ...
│
├── pom.xml
└── README.md
```

---

## ⚙️ Local Setup

### Requirements

* Java 8
* Maven
* MySQL
* Apache Tomcat
* Eclipse or any Java IDE

### Run Locally

1. Clone the repository.
2. Open the project in Eclipse or your preferred IDE.
3. Configure the MySQL database.
4. Configure the required API keys.
5. Run the application using Apache Tomcat.

---

## 🔒 Security

API keys and database credentials are not included in the repository. Configure your own credentials before running the project.

---

## 📚 Key Learning

* Java web development using Servlets and JSP
* JDBC and MySQL integration
* External API integration
* JSON data processing
* User authentication and watchlist functionality
* Maven and Tomcat application setup

---

## 🎓 Academic Project

This project was developed as a **Final-Year Academic Project** to gain practical experience in Java web development, database integration, API integration, and building a complete web application.

---

## 👨‍💻 Author

**Rupesh Ghadge**

⭐ Thanks for visiting the project!
