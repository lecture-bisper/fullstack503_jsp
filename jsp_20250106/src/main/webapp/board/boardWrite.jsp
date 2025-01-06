<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 6.
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 쓰기 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function() {
      $("#btn-cancel").on("click", function() {
        history.back();
      });
    });
  </script>

</head>
<body>

<header>
  <div class="container mt-4 p-5 bg-secondary-subtle rounded rounded-3">
    <h1 class="text-center my-3">게시글 쓰기 페이지</h1>
  </div>
</header>

<main class="container mt-5">
  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form action="insertProcess.jsp" method="post">
        <div class="mt-3">
          <label for="title" class="form-label">글제목 : </label>
          <input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력하세요">
        </div>
        <div class="mt-3">
          <label for="user-id" class="form-label">글쓴이 : </label>
          <input type="text" class="form-control" id="user-id" name="userId" placeholder="사용자 ID를 입력하세요">
        </div>
        <div class="mt-3">
          <label for="content" class="form-label">글제목 : </label>
          <textarea class="form-control" name="content" id="content" rows="5"></textarea>
        </div>
        <div class="mt-3">
          <div class="row">
            <div class="col-sm d-grid">
              <button type="submit" class="btn btn-primary">확인</button>
            </div>
            <div class="col-sm d-grid">
              <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</main>

<footer class="mt-5 border-top p-5">
  <p class="lead text-muted text-center">made by fullstack503</p>
</footer>

</body>
</html>











