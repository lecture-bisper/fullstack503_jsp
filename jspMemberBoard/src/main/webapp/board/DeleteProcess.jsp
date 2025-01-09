<%--
  User: 최수열
  Date: 25. 1. 8.
  Time: 오전 11:13
  글 삭제 처리
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. 필요한 클래스 import --%>
<%-- 3. DAO를 사용하여 데이터베이스 연결 --%>
<%-- 4. DAO에서 제공하는 메소드를 사용하여 게시물 삭제 --%>
<%-- 5. 데이터베이스 연결 종료 --%>
<%-- 6. 게시물 삭제 결과 확인 및 화면 이동 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDAO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.util.JSFunction" %>

<%-- 로그인 체크 --%>
<jsp:include page="./login/LoginCheck.jsp"></jsp:include>

<%
  int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));

  JSPBoardDAO dao = new JSPBoardDAO();;
  dao.dbOpen();

//  데이터베이스에 데이터 삭제 요청 후 결과 받아오기
  int result = dao.deleteBoard(boardIdx);

  dao.dbClose();

  if (result > 0) {
//    정상적으로 데이터 삭제 시 목록 페이지로 이동
    JSFunction.alertLocation("삭제되었습니다.", "./List.jsp", out);
  }
  else {
    JSFunction.alertBack("삭제에 실패했습니다.", out);
  }
%>










