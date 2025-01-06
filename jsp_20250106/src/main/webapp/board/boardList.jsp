<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 6.
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack503.jsp_20250106.database.JspBoardDTO" %>
<%@ page import="bitc.fullstack503.jsp_20250106.database.JspBoardDAO" %>
<%@ page import="java.util.List" %>

<%
  JspBoardDAO dao = new JspBoardDAO();
  dao.dbOpen();

  List<JspBoardDTO> boardList = dao.selectBoardList();

  dao.dbClose();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판 목록 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<header>
  <div class="container mt-4 p-5 bg-secondary-subtle rounded rounded-3">
    <h1 class="text-center my-3">게시판 목록 페이지</h1>
  </div>
</header>

<main class="container mt-5">
  <div class="row">
    <div class="col-sm">
      <div class="mt-3">
        <table class="table table-hover table-striped text-center">
          <colgroup>
            <col style="width:10%;">
            <col style="width:50%;">
            <col style="width:10%;">
            <col style="width:20%;">
            <col style="width:5%;">
            <col style="width:5%;">
          </colgroup>
          <thead>
            <tr>
              <th>글번호</th>
              <th>글제목</th>
              <th>글쓴이</th>
              <th>등록일</th>
              <th>조회수</th>
              <th>추천수</th>
            </tr>
          </thead>
          <tbody>
<%--          out.println() 를 사용하여 화면에 출력 --%>
<%--          <%--%>
<%--            for (JspBoardDTO board : boardList) {--%>
<%--              out.println("<tr>");--%>
<%--              out.println("<td>" + board.getBoardIdx() + "</td>");--%>
<%--              out.println("<td>" + board.getBoardTitle() + "</td>");--%>
<%--              out.println("<td>" + board.getBoardCreateId() + "</td>");--%>
<%--              out.println("<td>" + board.getBoardCreateDate() + "</td>");--%>
<%--              out.println("<td>" + board.getBoardCount() + "</td>");--%>
<%--              out.println("<td>" + board.getBoardLike() + "</td>");--%>
<%--              out.println("</tr>");--%>
<%--            }--%>
<%--          %>--%>

<%--          jsp의 표현식으로 화면에 출력 --%>
          <%
            for (JspBoardDTO board : boardList) {
          %>
            <tr>
              <td><%=board.getBoardIdx()%></td>
              <td class="text-start">
                <a href="./boardDetail.jsp?boardIdx=<%=board.getBoardIdx()%>" class="text-decoration-none"><%=board.getBoardTitle()%></a>
              </td>
              <td><%=board.getBoardCreateId()%></td>
              <td><%=board.getBoardCreateDate()%></td>
              <td><%=board.getBoardCount()%></td>
              <td><%=board.getBoardLike()%></td>
            </tr>
          <%
            }
          %>
          </tbody>
        </table>
      </div>
      <div class="d-flex justify-content-end mt-3">
        <a href="./boardWrite.jsp" target="_self" class="btn btn-primary">글쓰기</a>
      </div>
    </div>
  </div>
</main>

<footer class="mt-5 border-top p-5">
  <p class="lead text-muted text-center">made by fullstack503</p>
</footer>

</body>
</html>











