<%--
  User: 최수열
  Date: 25. 1. 8.
  Time: 오전 11:15
  로그아웃 처리
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 필요한 클래스 import --%>
<%-- 2. 세션에 저장된 내용 삭제 --%>
<%-- 3. 로그아웃 메시지 출력 후 List.jsp 페이지로 이동 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.util.JSFunction" %>

<%
//  세션에 저장되어 있는 userId, userName, userEmail을 삭제
  session.removeAttribute("userId");
  session.removeAttribute("userName");
  session.removeAttribute("userEmail");

//  세션에 저장되어 있는 모든 정보를 한번에 삭제
  session.invalidate();

//  게시판 목록 페이지로 이동
  JSFunction.alertLocation("로그아웃하였습니다.", "../List.jsp", out);
%>













