<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 2.
  Time: 오후 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- DB와 관련된 클래스 호출용 import --%>
<%@ page import="java.sql.*" %>

<%-- DB 커넥션 풀을 사용하기 위한 클래스 import --%>
<%@ page import="bitc.fullstack503.jsp_20250102.DBConnPool" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>statement 로 데이터 입력 처리</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%
// 커넥션 풀을 사용한 데이터베이스 접속 클래스 객체 생성
  DBConnPool db = new DBConnPool();

//  클라이언트에서 전달받은 데이터의 문자셋 설정
  request.setCharacterEncoding("UTF-8");
//  클라이언트에서 전달받은 데이터 가져오기
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userName = request.getParameter("userName");

//  데이터베이스의 실행 결과를 저장할 문자열
  String resultMessage = "";

  try {
//    SQL 쿼리문 생성
//    주의사항
//    1. 사용자가 쿼리문을 알아보기 쉽도록 여러 줄로 입력하는 것을 권장
//    2. 쿼리문을 여러 줄로 입력 시 한 라인의 마지막에 공백 기호 추가를 권장
//    3. Statement 객체 사용 시 문자열은 '' 으로 감싸야 하므로 변수 연결 시 '' 필수로 입력
    String sql = "INSERT INTO member (id, pass, name, regidate) ";
    sql += "VALUES ('" + userId + "', '" + userPw + "', '" + userName + "', now()) ";

//    Statement : 데이터베이스 서버로 SQL 쿼리문을 전달하는 클래스
//    정적인 쿼리문 혹은 간단한 쿼리문을 실행할 경우 사용
//    하나의 쿼리문을 사용하고 나면 더이상 사용할 수 없음
//    쿼리문 실행 후 close()를 사용하여 반드시 객체를 해제해야 함

//    executeUpdate() : insert, update, delete 문을 실행 시 사용하는 명령, int 타입 반환
//    executeQuery() : select 문을 실행 시 사용하는 명령, ResultSet 타입 반환
//    close() : Statement 객체를 해제하는 명령

//    createStatement() : Connection 객체를 통해서 Statement 객체를 생성
    db.stmt = db.conn.createStatement();
    int result = db.stmt.executeUpdate(sql);

    if (result > 0) {
      resultMessage = "회원 가입이 성공하였습니다.";
    }
    else {
      resultMessage = "회원 가입에 오류가 발생했습니다.";
    }
  }
  catch (SQLException e) {
    resultMessage = "회원 가입에 실패했습니다.<br>";
    resultMessage += "SQLException : " + e.getMessage();
  }
  finally {
    try {
      if (db.stmt != null) { db.stmt.close(); }
      if (db.conn != null) { db.conn.close(); }
    }
    catch (Exception e) {}
  }
%>

<div class="container mt-5">
  <h2 class="text-center">InsertProcess.jsp</h2>

  <div>
    <p><%=resultMessage%></p>
  </div>
</div>


</body>
</html>











