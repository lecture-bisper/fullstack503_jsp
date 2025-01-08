package bitc.fullstack503.jspmemberboard.database;

import jakarta.servlet.ServletConnection;
import jakarta.servlet.ServletContext;

import java.sql.*;

public class JDBConnect {

  private String dbDriver;
  private String dbUrl;
  private String dbUser;
  private String dbPass;

  public Connection conn;
  public Statement stmt;
  public PreparedStatement pstmt;
  public ResultSet rs;

  public JDBConnect() {
    this(
        "com.mysql.jdbc.Driver",
        "jdbc:mysql://localhost:3306/testfull503db?characterEncoding=UTF-8&serverTimezone=UTC",
        "test1",
        "full503"
    );
  }

  public JDBConnect(ServletContext app) {
    this(
        app.getInitParameter("MySqlDriver"),
        app.getInitParameter("MySqlUrl"),
        app.getInitParameter("MySqlUser"),
        app.getInitParameter("MySqlPass")
    );
  }

  public JDBConnect(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    this.dbDriver = dbDriver;
    this.dbUrl = dbUrl;
    this.dbUser = dbUser;
    this.dbPass = dbPass;
  }

  public void dbOpen() {
    try {
      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
      System.out.println("데이터베이스에 연결하였습니다.");
    }
    catch (Exception e) {
      System.out.println("데이터베이스 여결에 실패했습니다.");
      e.printStackTrace();
    }
  }

  public void dbClose() {
    try {
      if (rs != null) { rs.close(); }
      if (stmt != null) { stmt.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }

      System.out.println("데이터베이스 연결 및 리소스를 해제하였습니다.");
    } catch (Exception e) {
      System.out.println("데이터베이스 연결 및 리소스 해제 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }
}












