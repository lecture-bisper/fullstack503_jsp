<%--
  User: 최수열
  Date: 25. 1. 8.
  Time: 오전 11:11
  글쓰기 처리 페이지
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. 필요한 클래스 import --%>
<%-- 3. 전달받은 데이터로 DTO 객체 생성 --%>
<%-- 4. DAO 를 사용하여 데이터베이스 연결 --%>
<%-- 5. DAO에서 제공하는 메소드를 사용하여 사용자 추가 --%>
<%-- 6. 데이터베이스 연결 종료 --%>
<%-- 7. 결과에 따라 화면 이동 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDTO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDAO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.util.JSFunction" %>

<%-- JSP의 선언부를 사용하여 메소드를 선언 --%>
<%!
//  클라이언트에서 전달받은 데이터로 JSPBoardDTO 클래스 타입의 객체를 생성하는 메소드 선언
//  매개변수로 request 내장 객체를 받아서 사용
  private JSPBoardDTO createBoard(HttpServletRequest request) {
//    HttpSession : 세션 정보를 가지고 있는 클래스
//    request 내장객체에서 현재 접속에 대한 세션 정보를 가져옴
    HttpSession session = request.getSession();

//    JSPBoardDTO 클래스 타입의 객체 생성
    JSPBoardDTO board = new JSPBoardDTO();
//    클라이언트에서 전달받은 데이터를 getParameter()를 통해서 가져와서 JSPBoardDTO 객체에 저장
    board.setBoardTitle(request.getParameter("title"));
    board.setBoardContent(request.getParameter("content"));
//    세션 영역에 저장된 정보를 가져와서 JSPBoardDTO 객체에 저장
    board.setBoardCreateId((String)session.getAttribute("userId"));

    return board;
  }
%>

<%-- 로그인 체크 --%>
<jsp:include page="./login/LoginCheck.jsp"></jsp:include>

<%
  request.setCharacterEncoding("UTF-8");

//  String title = request.getParameter("title");
//  String content = request.getParameter("content");
//  String userId = request.getParameter("userId");

  JSPBoardDAO dao = new JSPBoardDAO();
  dao.dbOpen();

//  클라이언트에서 전달받은 데이터로 JSPBoardDTO 객체를 생성하고, DAO에서 제공하는 insertBoard() 메소드의 매개변수로 사용하여 데이터베이스에 데이터 저장
  int result = dao.insertBoard(createBoard(request));

  dao.dbClose();

//  데이터베이스에 데이터 저장 결과에 따라 화면 이동
  if (result > 0) {
    JSFunction.alertLocation("등록했습니다.", "./List.jsp", out);
  }
  else {
    JSFunction.alertBack("게시글을 등록하지 못하였습니다.", out);
  }
%>









