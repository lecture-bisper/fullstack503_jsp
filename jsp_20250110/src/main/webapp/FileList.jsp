<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 10.
  Time: 오후 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack503.jsp_20250110.database.JSPBoardFileDTO" %>
<%@ page import="bitc.fullstack503.jsp_20250110.database.JSPBoardFileDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>

<%

  JSPBoardFileDAO dao = new JSPBoardFileDAO();
  dao.dbOpen();

  List<JSPBoardFileDTO> fileList = dao.selectFileList();

  dao.dbClose();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">DB에 등록된 파일 목록 보기</h2>

  <div class="mt-3">
    <div class="row">
      <div class="col-sm">
        <table class="table table-hover table-striped">
          <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>카테고리</th>
            <th>원본파일명</th>
            <th>사본파일명</th>
            <th>작성일</th>
          </tr>
          </thead>
          <tbody>
            <%
              for (JSPBoardFileDTO file : fileList) {
            %>

            <tr>
              <td><%=file.getIdx()%></td>
              <td><%=file.getTitle()%></td>
              <td><%=file.getCate()%></td>
              <td><%=file.getOfile()%></td>
              <td><%=file.getSfile()%></td>
              <td><%=file.getPostDate()%></td>
              <td>
                <a href="./Download.jsp?oName=<%=URLEncoder.encode(file.getOfile(), "UTF-8")%>&sName=<%=URLEncoder.encode(file.getSfile(), "UTF-8")%>">[다운로드]</a>
              </td>
            </tr>

            <%
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>











