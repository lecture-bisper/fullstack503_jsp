<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDTO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDAO" %>

<%@ page import="java.util.List" %>

<%
  List<JSPBoardDTO> boardList = null;

  JSPBoardDAO dao = new JSPBoardDAO();
  dao.dbOpen();

  boardList = dao.selectBoardList();

  dao.dbClose();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원제 게시판 목록 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="./layout/Header.jsp" %>

<%@ include file="./layout/Menu.jsp" %>

<main class="container mt-5">
  <section>
    <div class="row my-3">
      <div class="col-sm">
        <table class="table table-hover table-striped text-center">
          <colgroup>
            <col style="width: 10%;">
            <col style="width: 55%;">
            <col style="width: 10%;">
            <col style="width: 15%;">
            <col style="width: 5%;">
            <col style="width: 5%;">
          </colgroup>
          <thead>
          <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>추천수</th>
          </tr>
          </thead>
          <tbody>
          <%
            for (JSPBoardDTO board : boardList) {
          %>
          <tr>
            <td><%=board.getBoardIdx()%></td>
            <td class="text-start">
              <a href="./View.jsp?boardIdx=<%=board.getBoardIdx()%>" class="text-decoration-none"><%=board.getBoardTitle()%></a>
            </td>
            <td><%=board.getBoardCreateId()%></td>
            <td><%=board.getBoardCreateDate()%></td>
            <td><%=board.getBoardViewCount()%></td>
            <td><%=board.getBoardLikeCount()%></td>
          </tr>
          <%
            }
          %>
          </tbody>
        </table>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-sm">
        <div class="d-flex justify-content-end">
          <a href="./Write.jsp" class="btn btn-primary">글쓰기</a>
        </div>
      </div>
    </div>
  </section>
</main>

<%@ include file="./layout/Footer.jsp"%>

</body>
</html>











