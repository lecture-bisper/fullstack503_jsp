<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 2.
  Time: 오전 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 커넥션 풀을 사용하는 사용자 클래스 import --%>
<%@ page import="bitc.fullstack503.jsp_20250102.DBConnPool" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>커넥션 풀을 사용한 DB 연결</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">커넥션 풀 방식으로 DB 연결하기</h2>

  <%
//    DBConnPool 클래스 타입의 객체 생성
    DBConnPool pool = new DBConnPool();

    String sql = "SELECT * FROM board ";
    pool.stmt = pool.conn.createStatement();
    pool.rs = pool.stmt.executeQuery(sql);

    while (pool.rs.next()) {
      out.println("<p>" + pool.rs.getString("title") + "</p>");
    }

//    커넥션 풀을 사용한 DB 접속 종료 (커넥션 풀 반납)
    pool.close();
  %>
</div>
</body>
</html>











