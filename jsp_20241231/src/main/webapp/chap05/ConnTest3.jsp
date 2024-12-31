<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%@ page import="bitc.fullstack503.jsp_20241231.JDBConnect" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>application 내장 객체를 사용한 방식</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">web.xml 을 사용하여 DB 연결</h2>

  <div>
    <%
//      application 내장객체를 사용하여 web.xml에 입력된 내용을 가져와서 데이터베이스 사용 설정
      String driver = application.getInitParameter("MySqlDriver");
      String dbUrl = application.getInitParameter("MySqlUrl");
      String dbUser = application.getInitParameter("MySqlUser");
      String dbPass = application.getInitParameter("MySqlPass");
      String dbOpt1 = application.getInitParameter("MySqlOpt1");
      String dbOpt2 = application.getInitParameter("MySqlOpt2");

//      접속 주소 생성
      dbUrl += "?" + dbOpt1 + "&" + dbOpt2;

//      매개변수가 있는 생성자를 사용하여 JDBConnect 클래스 타입의 객체 생성
      JDBConnect jdbConn = new JDBConnect(driver, dbUrl, dbUser, dbPass);

      try {
        String sql = "SELECT * FROM board ";
        jdbConn.stmt = jdbConn.conn.createStatement();
        jdbConn.rs = jdbConn.stmt.executeQuery(sql);

        while (jdbConn.rs.next()) {
          out.println("<p>" + jdbConn.rs.getString("title") + "</p>");
        }
      }
      catch (SQLException e) {
        out.println("데이터 조회 중 오류가 발생했습니다.<br>");
        out.println("SQLException : " + e.getMessage());
      }
      finally {
        jdbConn.close();
      }
    %>
  </div>

  <br><hr><br>

  <h2>application 내장객체를 직접 매개변수로 전달하여 DB 연결</h2>
  <div>
    <%
//      JSP에서 제공하는 내장 객체인 application 을 JDBConnect 클래스의 생성자 매개변수로 전달
      JDBConnect jdbConn2 = new JDBConnect(application);

      try {
        String sql = "SELECT * FROM board ";
        jdbConn2.stmt = jdbConn2.conn.createStatement();
        jdbConn2.rs = jdbConn2.stmt.executeQuery(sql);

        while (jdbConn2.rs.next()) {
          out.println("<p>" + jdbConn2.rs.getString("title") + "</p>");
        }
      }
      catch (SQLException e) {
        out.println("데이터 조회 중 오류가 발생했습니다.<br>");
        out.println("SQLException : " + e.getMessage());
      }
      finally {
        jdbConn2.close();
      }
    %>
  </div>
</div>
</body>
</html>











