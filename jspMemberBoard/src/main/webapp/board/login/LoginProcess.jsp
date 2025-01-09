<%--
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:14
  로그인 처리
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. 필요한 클래스 import --%>
<%-- 3. DAO 를 사용하여 데이터베이스 연결 --%>
<%-- 4. DAO 에서 제공하는 메소드로 사용자가 입력한 id/pw를 사용하는 사용자가 있는지 확인 --%>
<%-- 5. 데이터베이스 연결 종료 --%>
<%-- 6. 사용자가 있을 경우 DAO에서 제공하는 메소드로를 사용하여 해당 사용자의 정보 가져오기 --%>
<%-- 6.1 가져온 사용자 정보를 세션 영역에 저장 및 화면 이동 --%>
<%-- 7. 사용자가 없을 경우 로그인 실패 메시지 출력 및 화면 뒤로 가기 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPMemberDTO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPMemberDAO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.util.JSFunction" %>

<%
  request.setCharacterEncoding("UTF-8");

//  사용자가 입력한 id/pw 를 가져오기
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");

  JSPMemberDAO dao = new JSPMemberDAO();
  dao.dbOpen();

//  사용자가 입력한 id/pw를 사용하는 데이터가 있는지 확인, 있으면 true, 없으면 false
  boolean result = dao.isLogin(userId, userPw);

//  데이터가 있는지 확인
  if (result) {
//    데이터가 있을 경우 사용자가 입력한 id를 사용하는 사용자의 모든 정보를 가져옴
    JSPMemberDTO member = dao.getMemberInfo(userId);
//    데이터베이스 연결 종료, 사용자가 입력한 id/pw를 사용하는 사용자가 있을 경우 사용자 정보를 가져오기 위해서 로그인 여부 확인과 사용자 정보 가져오기 부분을 모두 실행한 후 데이터베이스 연결 종료
    dao.dbClose();

//    사용자가 입력한 id를 사용하는 사용자 정보가 있는지 확인
    if (member != null) {
//      가져온 사용자 정보를 세션 영역에 저장
      session.setAttribute("userId", member.getUserId());
      session.setAttribute("userName", member.getUserName());
      session.setAttribute("userEmail", member.getUserEmail());
//      세션 영역에 저장된 데이터의 유지 시간을 설정
      session.setMaxInactiveInterval(60 * 10);

//      페이지 이동
      JSFunction.alertLocation("로그인 되었습니다.", "../List.jsp", out);
    }
    else {
//      이전 페이지로 이동
      JSFunction.alertBack("ID 및 PASSWORD가 맞지 않습니다.", out);
    }
  }
  else {
//    사용자가 입력한 id/pw를 사용하는 사용자가 없을 경우 데이터베이스 연결 종료
    dao.dbClose();
//    이전 페이지로 이동
    JSFunction.alertBack("ID 및 PASSWORD가 맞지 않습니다.", out);
  }
%>









