<%--
  User: 최수열
  Date: 25. 1. 8.
  Time: 오전 11:12
  글 수정 처리
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. 필요한 클래스 import --%>
<%-- 3. 전달받은 데이터로 DTO 객체 생성 --%>
<%-- 4. DAO 를 사용하여 데이터베이스 연결 --%>
<%-- 5. DAO에서 제공하는 메소드를 사용하여 지정한 게시물의 정보 수정하기 --%>
<%-- 6. 데이터베이스 연결 종료 --%>
<%-- 7. 수정 결과 확인 및 화면 이동 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDTO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDAO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.util.JSFunction" %>

<%-- JSP의 선언부를 사용하여 메소드 선언 --%>
<%!
  private JSPBoardDTO createBoard(HttpServletRequest request) {
    JSPBoardDTO board = new JSPBoardDTO();
    board.setBoardIdx(Integer.parseInt(request.getParameter("boardIdx")));
    board.setBoardTitle(request.getParameter("boardTitle"));
    board.setBoardContent(request.getParameter("boardContent"));

    return board;
  }
%>

<%-- 로그인 체크 --%>
<jsp:include page="./login/LoginCheck.jsp"></jsp:include>

<%
  request.setCharacterEncoding("UTF-8");

  JSPBoardDTO board = createBoard(request);

  JSPBoardDAO dao = new JSPBoardDAO();
  dao.dbOpen();

//  데이터베이스에 데이터 수정 요청하고 결과를 받아옴
  int result = dao.updateBoard(board);

  dao.dbClose();

  if (result > 0) {
//    정상적으로 수정 완료 시 다시 View.jsp 페이지로 이동
    JSFunction.alertLocation("수정했습니다.", "./View.jsp?boardIdx=" + board.getBoardIdx(), out);
  }
  else {
    JSFunction.alertBack("수정에 실패했습니다.", out);
  }
%>











