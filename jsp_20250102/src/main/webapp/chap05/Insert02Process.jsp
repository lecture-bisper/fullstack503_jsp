<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 2.
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%@ page import="bitc.fullstack503.jsp_20250102.DBConnPool" %>

<%
  request.setCharacterEncoding("UTF-8");

  String title = request.getParameter("title");
  String userId = request.getParameter("userId");
  String contents = request.getParameter("contents");

  DBConnPool db = new DBConnPool();
  String msg = "";

  try {
    String sql = "INSERT INTO board (title, content, id, postdate, visitcount) ";
    sql += "VALUES (?, ?, ?, now(), ?) ";

//    PreparedStatement : 하나의 객체로 여러 번의 쿼리를 실행하거나 동일한 쿼리문으로 특정 값만 변경하면서 여러 번의 실행이 필요할 경우, 매개변수의 수가 많을 경우 사용하는 클래스
//    setXXX() 메소드를 사용하여 sql 쿼리문의 ? 기호에 데이터를 입력하여 사용
//    첫번째 매개변수인 index는 1부터 시작

//    PreparedStatement 에서 제공하는 메소드
//    setString(index, 데이터) : 문자열 데이터를 입력
//    setInt(index, 데이터) : 정수 데이터를 입력
//    setDouble(index, 데이터) : 실수 데이터를 입력
//    setDate(index, 데이터) : 날짜 데이터를 입력
//    setTimestamp(index, 데이터) : 시간 데이터를 입력
//    setObject(index, 데이터) : 객체 데이터를 입력
//    setXXX(index, 데이터) : 모든 데이터 타입에 대해서 메소드가 존재함

//    PreparedStatement 는 Statement 와는 달리 Connection 으로 객체 생성 시 SQL 쿼리문을 함께 입력, ? 부분에 setXXX() 메소드를 사용하여 데이터를 나중에 입력
    db.pstmt = db.conn.prepareStatement(sql);
    db.pstmt.setString(1, title);
    db.pstmt.setString(2, contents);
    db.pstmt.setString(3, userId);
    db.pstmt.setInt(4, 0);

//    executeUpdate() : PreparedStatement 에서도 동일하게 insert, update, delete 시 사용, 매개변수가 없음
//    executeQuery() : PreparedStatement 에서도 동일하게 select 시 사용, 매개변수 없음
    int result = db.pstmt.executeUpdate();

    if (result > 0) {
      msg = "PreparedStatement 로 " + result + "개의 항목을 입력했습니다.";
    }
    else {
      msg = "PreparedStatement 로 데이터 추가된 데이터가 없습니다";
    }
  }
  catch (SQLException e) {
    msg = "PreparedStatement 로 데이터 추가 중 오류가 발생했습니다.<br>";
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
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">PreparedStatement 로 데이터 추가하기</h2>

  <div class="mt-3">
    <p><%=msg%></p>
  </div>
</div>
</body>
</html>











