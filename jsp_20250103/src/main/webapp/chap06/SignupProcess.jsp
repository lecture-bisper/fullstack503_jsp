<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 3.
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- DTO, DAO 클래스 import --%>
<%@ page import="bitc.fullstack503.jsp_20250103.database.MemberDTO" %>
<%@ page import="bitc.fullstack503.jsp_20250103.database.MemberDAO" %>

<%-- 클라이언트에서 전달받은 데이터 가져오기 --%>
<%
  request.setCharacterEncoding("UTF-8");

  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userName = request.getParameter("userName");

  MemberDTO member = new MemberDTO();
  member.setId(userId);
  member.setName(userName);
  member.setPass(userPw);

//  DAO 클래스 타입의 객체 생성 및 DB연결
  MemberDAO dao = new MemberDAO();
  dao.dbOpen();

//  DAO 클래스에서 제공한 insertMember() 를 사용하여 회원 가입
  int result = dao.insertMember(member);

  dao.dbClose();

//  회원 가입 결과를 통해서 리다이렉트
  if (result > 0) {
    session.setAttribute("userName", userName);
    response.sendRedirect("SignupSuccess.jsp");
  }
  else {
    response.sendRedirect("SignupFail.jsp");
  }
%>










