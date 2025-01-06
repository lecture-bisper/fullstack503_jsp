<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 6.
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 수정 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function () {
      $("#btn-list").on('click', function () {
        location.href = "./boardList.jsp";
      });

      $("#btn-cancel").on('click', function () {
        history.back();
      });
    });
  </script>

</head>
<body>

<header>
  <div class="container mt-4 p-5 bg-secondary-subtle rounded rounded-3">
    <h1 class="text-center my-3">게시글 수정 페이지</h1>
  </div>
</header>

<main class="container mt-5">
  <form action="updateProcess.jsp" method="post">
    <%--  글번호, 글제목, 조회수 --%>
    <div class="row mt-3">
      <div class="col-sm">
        <div class="input-group">
          <span class="input-group-text">글번호</span>
          <input type="number" class="form-control" id="board-idx" name="boardIdx" value="100" readonly>
        </div>
      </div>
      <div class="col-sm-8">
        <div class="input-group">
          <span class="input-group-text">글제목</span>
          <input type="text" class="form-control" id="title" name="title" value="테스트 제목1">
        </div>
      </div>
      <div class="col-sm">
        <div class="input-group">
          <span class="input-group-text">조회수</span>
          <input type="number" class="form-control" id="count" name="count" value="10" readonly>
        </div>
      </div>
    </div>
    <%--  등록시간, 수정시간, 추천수, 글쓴이--%>
    <div class="row mt-3">
      <div class="col-sm">
        <div class="input-group">
          <span class="input-group-text">글쓴이</span>
          <input type="text" class="form-control" id="create-id" name="createId" value="test1" readonly>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="input-group">
          <span class="input-group-text">등록일</span>
          <input type="datetime-local" class="form-control" id="create-date" name="createDate"
                 value="2025-01-06 11:29:00" readonly>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="input-group">
          <span class="input-group-text">수정일</span>
          <input type="datetime-local" class="form-control" id="update-date" name="updateDate"
                 value="2025-01-06 11:30:00">
        </div>
      </div>
      <div class="col-sm">
        <div class="input-group">
          <span class="input-group-text">추천수</span>
          <input type="number" class="form-control" id="like" name="like" value="10" readonly>
        </div>
      </div>
    </div>
    <%--  글내용--%>
    <div class="row mt-3">
      <div class="col-sm">
        <div class="input-group">
          <span class="input-group-text">글내용</span>
          <textarea class="form-control" name="content" id="content" rows="10"></textarea>
        </div>
      </div>
    </div>
    <%--  버튼--%>
    <div class="row mt-3">
      <div class="col-sm">
        <div class="clearfix">
          <button type="button" class="float-start btn btn-secondary" id="btn-list">목록</button>
          <button type="submit" class="float-end btn btn-primary" id="btn-edit">수정</button>
          <button type="reset" class="float-end btn btn-warning me-2" id="btn-cancel">취소</button>
        </div>
      </div>
    </div>
  </form>
</main>

<footer class="mt-5 border-top p-5">
  <p class="lead text-muted text-center">made by fullstack503</p>
</footer>

</body>
</html>











