<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 2.
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%@ page import="bitc.fullstack503.jsp_20250102.DBConnPool" %>

<%
  request.setCharacterEncoding("UTF-8");

  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userName = request.getParameter("userName");

  DBConnPool db = new DBConnPool();
  String msg = "";

  try {
    String sql = "UPDATE member ";
    sql += "SET pass = '" + userPw + "', name = '" + userName + "' ";
    sql += "WHERE id = '" + userId + "' ";

    db.stmt = db.conn.createStatement();
    int result = db.stmt.executeUpdate(sql);

    if (result > 0) {
      msg = "사용자 정보를 수정하였습니다.";
    }
    else {
      msg = "사용자 정보를 수정 중 오류가 있습니다.";
    }
  }
  catch (SQLException e) {
    msg = "사용자 정보를 수정 중 오류가 있습니다.<br>";
    msg += "SQLException : " + e.getMessage();
  }
  finally {
    db.close();
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update 프로세스</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">Statement로 데이터 수정</h2>

  <div class="mt-3">
    <p><%=msg%></p>
  </div>
</div>
</body>
</html>











