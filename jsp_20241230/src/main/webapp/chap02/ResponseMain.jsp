<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장객체 - Response</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h3>내장 객체 - response</h3>

  <div>
    <h2>1. 로그인 폼</h2>
    <%
      request.setCharacterEncoding("UTF-8");
//      처음 현재 페이지 실행 시 loginErr 이 없음
//      forward 된 현재 페이지에서는 loginErr 이 있음
      String loginErr = request.getParameter("loginErr");
      if (loginErr != null) {
        out.println("로그인 실패");
      }
    %>

    <form action="ResponseLogin.jsp" method="post">
      <div class="mt-3">
        <label for="user-id" class="form-label">아이디 : </label>
        <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요">
      </div>
      <div class="mt-3">
        <label for="user-pw" class="form-label">비밀번호 : </label>
        <input type="text" class="form-control" id="user-pw" name="userPw" placeholder="비밀번호를 입력하세요">
      </div>
      <div class="mt-3 d-flex justify-content-end">
        <button type="submit" class="btn btn-primary">로그인</button>
      </div>
    </form>

    <br><hr><br>

    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <form action="ResponseHeader.jsp" method="get">
      <div class="mt-3">
        <label for="add-date" class="form-label">날짜 형식 : </label>
        <input type="text" class="form-control" id="add-date" name="addDate" value="2024-12-30 10:43">
      </div>
      <div class="mt-3">
        <label for="add-int" class="form-label">숫자 형식 : </label>
        <input type="text" class="form-control" id="add-int" name="addInt" value="8282">
      </div>
      <div class="mt-3">
        <label for="add-str" class="form-label">문자 형식 : </label>
        <input type="text" class="form-control" id="add-str" name="addStr" value="홍길동">
      </div>
      <div class="mt-3 d-flex justify-content-end">
        <button type="submit" class="btn btn-primary">응답 헤더 설정 & 출력</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>











