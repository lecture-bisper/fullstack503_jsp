<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달된 데이터 가져오기 --%>
<%-- 2. DAO 를 사용하여 데이터베이스에 연결 --%>
<%-- 3. DAO 에서 제공하는 메소드를 사용하여 전달받은 데이터로 데이터 수정 --%>
<%-- 4. 데이터베이스 연결 종료 --%>
<%-- 5. 데이터베이스 수정 결과에 따라 화면이동(boardList.jsp, 이전화면) --%>

<%@ page import="bitc.fullstack503.jsp_20250106.database.JspBoardDAO" %>

<%
  request.setCharacterEncoding("UTF-8");

  int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
  String title = request.getParameter("title");
  String content = request.getParameter("content");

  JspBoardDAO dao = new JspBoardDAO(application);
  dao.dbOpen();

  int result = dao.updateBoard(boardIdx, title, content);

  dao.dbClose();

  if (result > 0) {
    out.println("<script>");
    out.println("alert('수정되었습니다.');");
    out.println("location.href='./boardList.jsp';");
//    out.println("location.href='./boardDtail.jsp?boardIdx=" + boardIdx + "';");
    out.println("</script>");
  }
  else {
    out.println("<script>");
    out.println("alert('수정에 실패했습니다.');");
    out.println("history.back();");
    out.println("</script>");
  }
%>











