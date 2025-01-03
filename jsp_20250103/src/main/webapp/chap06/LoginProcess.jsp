<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 3.
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 데이터베이스 사용을 위해서 import --%>
<%@ page import="java.sql.*" %>

<%
  request.setCharacterEncoding("UTF-8");

//  클라이언트에서 전달받은 사용자 ID와 비밀번호를 가져옴
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");

//  DB를 연결하여 로그인 처리

//  데이터베이스 사용 시 필요한 클래스 타입의 변수 선언
Connection conn = null; // 데이터베이스 접속 시
PreparedStatement pstmt = null; // 데이터베이스에 SQL 쿼리문 실행
ResultSet rs = null; // SQL문 실행 후 결과 받기

//  데이터베이스 접속 정보 설정
String dbDriver = "com.mysql.cj.jdbc.Driver";
String dbUrl = "jdbc:mysql://localhost:3306/testfull503db?characterEncoding=UTF-8&serverTimezone=UTC";
String dbUser = "test1";
String dbPass = "full503";

//  MySQL 데이터베이스 드라이버 로딩
  Class.forName(dbDriver);
//  MySQL 데이터베이스에 접속
  conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

  try {
//    sql 문 생성, 사용자가 입력한 id/pw를 같은 데이터가 있는지 확인하는 SQL문
//    있으면 1, 없으면 0
    String sql = "SELECT count(*) AS cnt ";
    sql += "FROM member ";
    sql += "WHERE id = ? ";
    sql += "AND pass = ? ";

//    PrepareStatement 객체 생성
    pstmt = conn.prepareStatement(sql);
//    SQL문에 데이터 설정
    pstmt.setString(1, userId);
    pstmt.setString(2, userPw);

//    데이터베이스에 완성된 SQL 문을 전달하여 실행
    rs = pstmt.executeQuery();

    while (rs.next()) {
      int count = rs.getInt("cnt");

//      데이터베이스에서 가져온 데이터와 사용자가 입력한 데이터가 같은지 확인
      if (count == 1) {
//        데이터베이스에 사용자가 입력한 id/pw를 사용하는 정보가 존재하므로 해당 사용자의 모든 정보를 가져오기 위한 SQL 문 새로 작성
        sql = "SELECT id, name, regidate ";
        sql += "FROM member ";
        sql += "WHERE id = ? ";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);

//        데이터베이스에 SQL 쿼리문 전달 후 결과 받아오기
        ResultSet result = pstmt.executeQuery();

        if (result.next()) {
//          데이터베이스에서 가져온 결과가 있을 경우 해당 데이터를 세션 영역에 저장
          session.setAttribute("userId", result.getString("id"));
          session.setAttribute("userName", result.getString("name"));
          session.setAttribute("regiDate", result.getString("regidate"));
          session.setMaxInactiveInterval(60 * 5); // 세션 유지 시간 설정

//          로그인 성공 페이지로 이동
          response.sendRedirect("LoginOK.jsp");
        }
        else {
//          데이터베이스에서 가져온 결과가 없을 경우 로그인 실패 페이지로 이동
          response.sendRedirect("LoginFail.jsp");
        }
      }
      else {
//        DB에 사용자 정보가 없기 때문에 로그인 실패 페이지로 이동
        response.sendRedirect("LoginFail.jsp");
      }
    }
  }
  catch(SQLException e) {
    out.println("데이터베이스 사용 중 오류가 발생했습니다.<br>");
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    try {
      if (rs != null) { rs.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }
    }
    catch (Exception e) {}
  }


//  DB연결 없이 로그인 처리했을 경우
////  전달받은 id/pw가 서버에 존재하는지 여부 확인
//  if (userId.equals("test1") && userPw.equals("1234")) {
////    로그인 성공 시 세션 영역에 데이터 추가
//    session.setAttribute("userId", userId);
//    session.setAttribute("userName", "테스터1");
//    session.setMaxInactiveInterval(60 * 3);
//
////    로그인 성공 시 사용자가 보는 페이지로 이동
//    response.sendRedirect("LoginOK.jsp");
//  }
//  else {
////    로그인 실패 시 사용자가 보는 페이지로 이동
//    response.sendRedirect("LoginFail.jsp");
//  }
%>











