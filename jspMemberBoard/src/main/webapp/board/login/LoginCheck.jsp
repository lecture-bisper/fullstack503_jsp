<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 9.
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 다른 파일에서 include하여 세션 체크를 실행하는 파일 --%>

<%-- 화면 이동을 위해서 사용하는 사용자가 생성한 Util 클래스 --%>
<%@ page import="bitc.fullstack503.jspmemberboard.util.JSFunction" %>

<%
//  세션 영역에 저장된 데이터 중 userId 를 가져와서 값이 null인지 확인
//  null이면 로그 아웃 상태, null이 아니면 로그인 상태
  if (session.getAttribute("userId") == null) {
//    로그인 상태가 아닐 경우 로그인 페이지로 이동
    JSFunction.alertLocation("로그인 후 이용하세요", "/board/login/Login.jsp", out);
    return;
  }
%>











