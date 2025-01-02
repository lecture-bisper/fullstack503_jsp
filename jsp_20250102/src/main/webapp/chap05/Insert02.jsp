<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 2.
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PreparedStatement 로 데이터 입력</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">PreparedStatement로 데이터 입력하기</h2>

  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form action="Insert02Process.jsp" method="post">
        <div class="mt-3">
          <label for="title" class="form-label">제목 : </label>
          <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
        </div>
        <div class="mt-3">
          <label for="user-id" class="form-label">ID : </label>
          <input type="text" class="form-control" id="user-id" name="userId" placeholder="사용자 ID를 입력하세요">
        </div>
        <div class="mt-3">
          <label for="contents" class="form-label">내용 : </label>
          <textarea class="form-control" id="contents" name="contents" rows="5" placeholder="내용을 입력하세요"></textarea>
        </div>
        <div class="mt-3 d-grid gap-2">
          <button type="submit" class="btn btn-outline-primary">등록</button>
          <button type="reset" class="btn btn-outline-secondary">취소</button>
        </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>











