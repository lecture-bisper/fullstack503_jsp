<%--
  User: 최수열
  Date: 25. 1. 8.
  Time: 오전 11:14
  회원 가입 처리
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. 필요한 클래스 import --%>
<%-- 3. DAO 를 사용하여 데이터베이스 연결 --%>
<%-- 4. DAO에서 제공하는 메소드를 사용하여 사용자 추가 --%>
<%-- 5. 데이터베이스 연결 종료 --%>
<%-- 6. 데이터베이스 사용 결과에 따라 화면 이동 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPMemberDTO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPMemberDAO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.util.JSFunction" %>

<%
  request.setCharacterEncoding("UTF-8");

//  클라이언트에서 전달받은 데이터 가져오기
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userName = request.getParameter("userName");
  String userEmail = request.getParameter("userEmail");
  String userPhone = request.getParameter("userPhone");
  String userAddr = request.getParameter("userAddr");

//  클라이언트에서 전달받은 데이터를 JSPBoardDTO 타입의 객체로 생성 및 데이터 저장
  JSPMemberDTO member = new JSPMemberDTO();
  member.setUserId(userId);
  member.setUserPw(userPw);
  member.setUserName(userName);
  member.setUserEmail(userEmail);
  member.setUserPhone(userPhone);
  member.setUserAddress(userAddr);

  JSPMemberDAO dao = new JSPMemberDAO();
  dao.dbOpen();

//  데이터베이스에 사용자 정보 추가 후 결과 받아오기
  int result = dao.insertMember(member);

  dao.dbClose();

  if (result > 0) {
    JSFunction.alertLocation("회원 가입에 성공했습니다.", "./Login.jsp", out);
  }
  else {
    JSFunction.alertBack("회원 가입에 실패했습니다.", out);
  }
%>











