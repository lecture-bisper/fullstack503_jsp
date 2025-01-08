<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원제 게시판 회원 가입 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function () {
      $("#btn-join").on("click", function () {
        var frm = $("#frm")[0];
        var pw1 = $("#user-pw1").val().trim();
        var pw2 = $("#user-pw2").val().trim();

        if (pw1 != pw2) {
          alert("비밀번호가 일치하지 않습니다.");

          $("#user-pw2").focus();
        }
        else {
          frm.submit();
        }
      });

      $("#btn-cancel").on("click", function () {
        history.back();
      });
    });
  </script>

</head>
<body>

<%@ include file="../layout/Header.jsp" %>

<%@ include file="../layout/Menu.jsp" %>

<main class="container mt-5">
  <section>
    <div class="row">
      <div class="col-sm-4 mx-auto border rounded rounded-3 p-3">
        <form id="frm" action="./MemberJoinProcess.jsp" method="post">
          <div class="mt-3 form-floating">
            <input type="text" class="form-control" id="user-id" name="userId" placeholder="등록할 ID를 입력하세요">
            <label for="user-id">등록할 ID를 입력하세요</label>
          </div>
          <div class="mt-3 form-floating">
            <input type="password" class="form-control" id="user-pw1" name="userPw" placeholder="등록할 비밀번호를 입력하세요">
            <label for="user-pw1">등록할 비밀번호를 입력하세요</label>
          </div>
          <div class="mt-3 form-floating">
            <input type="password" class="form-control" id="user-pw2" placeholder="비밀번호 확인">
            <label for="user-pw2">비밀번호 확인</label>
          </div>
          <div class="mt-3 form-floating">
            <input type="text" class="form-control" id="user-name" name="userName" placeholder="등록할 이름을 입력하세요">
            <label for="user-name">등록할 이름을 입력하세요</label>
          </div>
          <div class="mt-3 form-floating">
            <input type="email" class="form-control" id="user-email" name="userEmail" placeholder="등록할 이메일을 입력하세요">
            <label for="user-email">등록할 이메일을 입력하세요</label>
          </div>
          <div class="mt-3 form-floating">
            <input type="text" class="form-control" id="user-phone" name="userPhone" placeholder="등록할 연락처를 입력하세요">
            <label for="user-phone">등록할 연락처를 입력하세요</label>
          </div>
          <div class="mt-3 form-floating">
            <input type="text" class="form-control" id="user-addr" name="userAddr" placeholder="등록할 주소를 입력하세요">
            <label for="user-addr">등록할 주소를 입력하세요</label>
          </div>
          <div class="mt-3 d-grid gap-2">
            <button type="button" class="btn btn-primary" id="btn-join">회원가입</button>
            <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>

<%@ include file="../layout/Footer.jsp"%>

</body>
</html>











