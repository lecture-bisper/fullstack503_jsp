<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%-- 데이터베이스 접속을 위한 클래스를 import --%>
<%@ page import="bitc.fullstack503.jsp_20241231.JDBConnect" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Java Class를 이용한 접속방법</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>Java Class를 사용하여 DB 연결</h2>

  <%
//    import 한 jDBConnect 클래스를 사용하여 객체 생성
    JDBConnect jdbConn = new JDBConnect();

    try {
      String sql = "SELECT * FROM board ";

//      생성된 JDBConnect 클래스 타입의 객체 jdbConn을 사용하여 Statement 객체 생성
      jdbConn.stmt = jdbConn.conn.createStatement();
//      Statement 를 사용하여 SQL문을 데이터베이스에 전달하여 실행
//      ResultSet에 저장
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

</body>
</html>











