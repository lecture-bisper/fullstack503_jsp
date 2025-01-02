<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 2.
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%@ page import="bitc.fullstack503.jsp_20250102.DBConnPool" %>

<%
  request.setCharacterEncoding("UTF-8");

  String userId = request.getParameter("userId");

  DBConnPool db = new DBConnPool();
  String msg = "";

  try {
    String sql = "SELECT id, name, regidate FROM member ";
    sql += "WHERE id = '" + userId + "' ";

    db.stmt = db.conn.createStatement();
//    executeQuery() : Statement 객체를 사용하여 SELECT 쿼리문을 데이터베이스에서 실행하는 명령어, 반환값은 ResultSet 타입
    db.rs = db.stmt.executeQuery(sql);
//    ResultSet : 데이터베이스에서 select 쿼리문을 사용하여 조회된 데이터를 저장할 수 있는 클래스
//    ResultSet의 메소드
//    next() : 데이터가 저장된 ResultSet 객체에서 출력할 데이터가 있는지 확인하는 명령어
//    데이터가 있을 경우 데이터를 가져오고 true 를 반환
//    데이터가 없을 경우는 false 를 반환
//    getString() : ResultSet 클래스에서 제공하는 데이터 출력 명령어, String 타입으로 출력
//    매개변수에 컬럼을 입력하여 데이터를 출력, 매개변수에 index 번호도 사용 가능
//    getInt() : ResultSet 클래스에서 제공하는 데이터 출력 명령어, int 타입으로 출력
//    getXXX() : ResultSet 클래스에서 제공하는 데이터 출력 명령어, 모든 데이터 타입의 메소드가 존재함

    while (db.rs.next()) {
      String id = db.rs.getString("id");
      String name = db.rs.getString("name");
      String regiDate = db.rs.getString("regidate");
      msg = "ID : " + id + "<br>이름 : " + name + "<br>등록시간 : " + regiDate;
    }
  }
  catch (SQLException e) {
    msg = "사용자 조회 중 오류가 발생했습니다.<br>";
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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </head>
  <body>

  <div class="container mt-5">
    <h2 class="text-center">Statement 로 데이터 조회하기</h2>

    <div class="mt-3">
      <p><%=msg%></p>
    </div>
  </div>
  </body>
</html>











