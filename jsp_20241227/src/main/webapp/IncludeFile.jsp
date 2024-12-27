<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 현재 파일에서 java 클래스를 사용하기 위해서 page 디렉티브 태그의 import 속성 사용--%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.LocalDate" %>

<%
  // LocatDate 타입의 객체 및 LocalDateTime 타입의 객체 선언
  LocalDate today = LocalDate.now();
  LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);
%>











