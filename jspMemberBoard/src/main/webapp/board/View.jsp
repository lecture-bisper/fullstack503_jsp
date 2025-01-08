<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원제 게시판 상세 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <style>
    .caption1 { width: 75px; }
  </style>
  <script>
    $(document).ready(function () {
      $("#btn-list").on("click", function() {
        location.href = './List.jsp';
      });

      $("#btn-edit").on("click", function() {
        var boardIdx = $("#board-idx").val();
        location.href = './Edit.jsp?boardIdx=' + boardIdx;
      });

      $("#btn-delete").on("click", function() {
        var confirmed = confirm("삭제 하시겠습니까?");

        if (confirmed) {
          var frm = $("#frm")[0];
          frm.action = "./DeleteProcess.jsp";
          frm.submit();
        }
      });
    });
  </script>

</head>
<body>

<%@ include file="./layout/Header.jsp" %>

<%@ include file="./layout/Menu.jsp" %>

<main class="container mt-5">
  <section>
    <form id="frm" method="post">
      <div class="row mt-3">
        <div class="col-sm-3">
          <div class="input-group">
            <span class="input-group-text caption1">글번호</span>
            <input type="text" class="form-control" id="board-idx" name="boardIdx" readonly value="100">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">제목</span>
            <input type="text" class="form-control" id="board-title" name="boardTitle" readonly value="테스트 제목">
          </div>
        </div>
        <div class="col-sm-3">
          <div class="input-group">
            <span class="input-group-text caption1">조회수</span>
            <input type="number" class="form-control" id="board-view-count" name="boardViewCount" readonly value="100">
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">등록일</span>
            <input type="datetime-local" class="form-control" id="board-create-date" name="boardCreateDate" readonly value="2025-01-08 16:20:00">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">작성자</span>
            <input type="text" class="form-control" id="board-create-id" name="boardCreateId" readonly value="test1">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">수정일</span>
            <input type="datetime-local" class="form-control" id="board-update-date" name="boardUpdateDate" readonly value="2025-01-08 17:20:00">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">추천수</span>
            <input type="number" class="form-control" id="board-like-count" name="boardLikeCount" readonly value="10">
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">내용</span>
            <textarea class="form-control" name="boardContent" id="board-content" rows="10" placeholder="내용을 입력하세요"></textarea>
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm">
          <button type="button" class="btn btn-outline-secondary" id="btn-list">목록</button>
        </div>
        <div class="col-sm d-flex justify-content-end">
          <button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
          <button type="button" class="btn btn-warning ms-2" id="btn-edit">수정</button>
        </div>
      </div>
    </form>
  </section>
</main>

<%@ include file="./layout/Footer.jsp"%>

</body>
</html>











