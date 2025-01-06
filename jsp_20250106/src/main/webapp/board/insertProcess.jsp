<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 6.
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack503.jsp_20250106.database.JspBoardDTO" %>
<%@ page import="bitc.fullstack503.jsp_20250106.database.JspBoardDAO" %>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. DAO 객체 생성 후 데이터베이스 연결 --%>
<%-- 3. 클라이언트에서 전달받은 데이터로 DTO 객체 생성 --%>
<%-- 4. DAO 객체에서 제공하는 메소드로 데이터베이스에 데이터 추가 --%>
<%-- 5. 데이터베이트 접속 종료 --%>
<%-- 6. 데이터베이스 추가 결과에 따라 리다이렉트 --%>

<%
  request.setCharacterEncoding("UTF-8");

  String userId = request.getParameter("userId");
  String title = request.getParameter("title");
  String content = request.getParameter("content");

  JspBoardDTO board = new JspBoardDTO();
  board.setBoardCreateId(userId);
  board.setBoardTitle(title);
  board.setBoardContent(content);

  JspBoardDAO dao = new JspBoardDAO();
  dao.dbOpen();

  int result = dao.insertBoard(board);

  dao.dbClose();

  if (result > 0) {
    out.println("<script>");
    out.println("alert('게시글이 등록되었습니다.');");
    out.println("location.href='./boardList.jsp';");
    out.println("</script>");
  }
  else {
    out.println("<script>");
    out.println("alert('게시글을 등록하지 못했습니다.');");
    out.println("history.back();");
    out.println("</script>");
  }
%>











