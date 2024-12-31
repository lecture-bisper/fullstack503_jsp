<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>JDBC 사용하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%-- 미리 데이터베이스 접속 정보가 입력된 jsp 파일을 포함 --%>
<%@ include file="./dbConn.jsp" %>

<div class="container mt-5">
  <h2>기존 JSP 파일을 통해서 DB 접속하기</h2>

  <%
//    Statement : 데이터베이스에 접속하여 sql 쿼리문을 질의하는 클래스
//    ResultSet : 2차원 배열 형태로 이루어진 데이터베이스 질의 결과를 저장하는 클래스
    Statement stmt = null;
    ResultSet rs = null;

    try {
//      sql 문 생성
      String sql = "SELECT * FROM board ";
//      데이터베이스 접속 정보를 기반으로 SQL문을 질의하기 위한 Statement 클래스 객체 생성
      stmt = conn.createStatement();
//      Statement 클래스 객체를 사용하여 미리 생성한 SQL문을 데이터베이스에 전달하여 실행
      rs = stmt.executeQuery(sql);

//      ResultSet 객체에 저장된 데이터가 있는지 확인
      while (rs.next()) {
//        getString() : ResultSet 객체에 저장되어 있는 데이터를 문자열로 가져옴
        out.println("<p>" + rs.getString("title") + "</p>");
      }
    }
    catch (SQLException e) {
      out.println("데이터 조회 중 오류가 발생했습니다.<br>");
      out.println("SQLException : " + e.getMessage());
    }
    finally {
//      데이터베이스 사용이 종료된 후 접속 종료
      try {
//        데이터베이스를 사용 종료 시 접속 순서의 반대로 닫아야 함
//        ResultSet => Statement => Connection 순서대로 사용 종료 함
        if (rs != null) { rs.close(); }
        if (stmt != null) { stmt.close(); }
        if (conn != null) { conn.close(); }
      }
      catch (Exception e) {}
    }
  %>
</div>
</body>
</html>











