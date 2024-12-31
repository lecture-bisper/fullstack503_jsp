<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오후 2:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%
//  실제 데이터베이스에 접속하기 위한 클래스
  Connection conn = null;

//  데이터베이스 접속 주소
  String dbUrl = "jdbc:mysql://localhost:3306/testfull503db?characterEncoding=UTF-8&serverTimezone=UTC";
//  사용자 ID
  String dbUser = "test1";
//  사용자 PW
  String dbPass = "full503";

//  JDBC 드라이버 로딩
  Class.forName("com.mysql.cj.jdbc.Driver");
//  getConnection() 메소드를 이용하여 데이터베이스에 접속, 접속 상태 정보를 Connection 클래스 타입의 변수에 저장
  conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
%>










