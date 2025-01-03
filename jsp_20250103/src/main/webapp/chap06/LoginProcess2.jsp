<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 3.
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 데이터베이스에서 전달받은 데이터를 저장할 DTO 클래스 import --%>
<%@ page import="bitc.fullstack503.jsp_20250103.database.MemberDTO" %>
<%-- 데이터베이스에서 member 테이블을 컨트롤 할 DAO 클래스 import --%>
<%@ page import="bitc.fullstack503.jsp_20250103.database.MemberDAO" %>

<%
  request.setCharacterEncoding("UTF-8");

//  클라이언트에서 데이터 전달받기
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");

//  데이터베이스의 member 테이블의 컨트롤하는 MemberDAO 클래스의 객체를 생성
  MemberDAO dao = new MemberDAO();
//  MemberDAO 클래스에서 제공하는 dbOpen() 메소드를 사용하여 데이터베이스 연결
  dao.dbOpen();

//  MemberDAO 클래스에서 제공하는 isMember() 메소드를 사용하여 사용자가 있는지 확인
  boolean result = dao.isMember(userId, userPw);

//  사용자 유무를 가지고 로그인 처리
  if (result == true) {
//    사용자가 있을 경우, MemberDAO 클래스에서 제공하는 selectMember() 메소드를 사용하여 해당 사용자의 데이터를 가져옴
    MemberDTO member = dao.selectMember(userId);

//    가져온 사용자 데이터를 세션 영역에 저장
    session.setAttribute("userId", member.getId());
    session.setAttribute("userName", member.getName());
    session.setMaxInactiveInterval(60 * 5);

//    데이터베이스 사용 종료
    dao.dbClose();
//    로그인 성공 페이지로 이동
    response.sendRedirect("LoginOK.jsp");
  }
  else {
//    사용자가 없을 경우, 데이터베이스 사용 종료
    dao.dbClose();
//    로그인 실패 페이지로 이동
    response.sendRedirect("LoginFail.jsp");
  }
%>











