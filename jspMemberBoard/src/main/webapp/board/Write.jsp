<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 로그인 체크 --%>
<jsp:include page="./login/LoginCheck.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원제 게시판 글 쓰기 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function () {
      $("#btn-list").on("click", function () {
        history.back();
      });
    });
  </script>

</head>
<body>

<%@ include file="./layout/Header.jsp" %>

<%@ include file="./layout/Menu.jsp" %>

<main class="container mt-5">
  <section>
    <div class="row mt-3">
      <div class="col-sm">
        <form action="./WriteProcess.jsp" method="post">
          <div class="mt-3">
            <label for="title" class="form-label">제목 :</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
          </div>
          <div class="mt-3">
            <label for="content" class="form-label">내용 :</label>
            <textarea class="form-control" name="content" id="content" rows="10" placeholder="내용을 입력하세요"></textarea>
          </div>
          <div class="mt-3 clearfix">
            <button type="button" class="btn btn-outline-secondary float-start" id="btn-list">목록</button>
            <button type="submit" class="btn btn-primary float-end">작성 완료</button>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>

<%@ include file="./layout/Footer.jsp"%>

</body>
</html>











