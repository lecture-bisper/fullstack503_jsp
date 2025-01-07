<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 글 번호를 가져옴 --%>
<%-- 2. DAO를 사용하여 데이터베이스 연결 --%>
<%-- 3. DAO에서 제공하는 메소드를 사용하여 데이터베이스에서 삭제 --%>
<%-- 4. 데이터베이스 연결 종료 및 결과 확인 --%>
<%-- 5. 리다이렉트 --%>

<%@ page import="bitc.fullstack503.jsp_20250106.database.JspBoardDAO" %>

<%
  int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));

  JspBoardDAO dao = new JspBoardDAO(application);
  dao.dbOpen();

  int result = dao.deleteBoard(boardIdx);

  dao.dbClose();

  if (result > 0) {
    out.println("<script>");
    out.println("alert('삭제되었습니다.');");
    out.println("location.href='./boardList.jsp';");
    out.println("</script>");
  }
  else {
    out.println("<script>");
    out.println("alert('삭제에 실패했습니다.');");
    out.println("history.back();");
    out.println("</script>");
  }
%>











