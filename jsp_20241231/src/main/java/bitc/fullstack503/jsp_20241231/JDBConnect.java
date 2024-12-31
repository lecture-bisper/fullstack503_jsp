package bitc.fullstack503.jsp_20241231;

import jakarta.servlet.ServletContext;

import java.sql.*;

public class JDBConnect {

//  데이터베이스 접속을 위해서 사용하는 클래스
  public Connection conn;
//  데이터베이스에 SQL문을 전달하여 실행하기 위한 클래스(단순 쿼리문)
  public Statement stmt;
//  데이터베이스에 SQL문을 전달하여 실행하기 위한 클래스(복잡한 쿼리문)
  public PreparedStatement pstmt;
//  SELECT 문의 결과를 데이터베이스에서 받아오는 클래스
  public ResultSet rs;

//  생성자에 DB 접속 정보를 직접 입력
  public JDBConnect() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");

      String dbUrl = "jdbc:mysql://localhost:3306/testfull503db?characterEncoding=UTF-8&serverTimezone=UTC";
      String dbUser = "test1";
      String dbPass = "full503";

      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
      System.out.println("DB 연결 성공 (기본 생성자 사용)");
    }
    catch (Exception e) {
      System.out.println("DB 연결 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }

//  DB 접속 정보를 매개변수로 전달받아 접속하는 생성자
  public JDBConnect(String driver, String dbUrl, String dbUser, String dbPass) {
    try {
//      매개변수로 받아온 드라이버 정보로 데이터베이스 드라이버 로드
      Class.forName(driver);
//      매개변수로 받아온 데이터베이스 주소, 사용자 ID, 사용자 비밀번호로 데이터베이스 접속
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

      System.out.println("DB 연결 성공 (매개변수가 있는 생성자)");
    }
    catch (Exception e) {
      System.out.println("DB 연결 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }

//  매개변수로 application 내장객체를 받아서 사용하는 생성자
  public JDBConnect(ServletContext application) {
    try {
//      매개변수로 받은 application 내장객체를 사용하여 web.xml 의 내용을 가져와서 사용함
      String dbDriver = application.getInitParameter("MySqlDriver");
      String dbUrl = application.getInitParameter("MySqlUrl");
      String dbUser = application.getInitParameter("MySqlUser");
      String dbPass = application.getInitParameter("MySqlPass");
      String dbOpt1 = application.getInitParameter("MySqlOpt1");
      String dbOpt2 = application.getInitParameter("MySqlOpt2");

//      xml 파일에서 특수기호 사용 시 정상적으로 동작하지 않음
//      데이터베이스 접속 주소의 옵션 부분을 따로 분리하여 사용
//      xml 파일에서 html 특수기호로 사용 시 옵션을 분리하지 않고 한번에 다 입력할 수 있음
      dbUrl += "?" + dbOpt1 + "&" + dbOpt2;

      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

      System.out.println("DB 연결 성공 (application 내장객체를 사용)");
    }
    catch (Exception e) {
      System.out.println("DB 연결 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }

//  한번에 모든 접속을 종료하기 위한 메소드 설정
  public void close() {
    try {
      if (rs != null) { rs.close(); }
      if (stmt != null) { stmt.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }
    }
    catch (Exception e) {
      System.out.println("DB 접속 종료 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }


}












