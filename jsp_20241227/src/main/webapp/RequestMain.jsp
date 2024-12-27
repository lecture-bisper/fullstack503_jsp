<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - request</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
  <a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">Get 방식 전송</a>
  <br>
  <form action="RequestWebInfo.jsp" method="POST">
    <div class="mt-3">
      <label for="eng" class="form-label">영어 : </label>
<%--      input 태그의 name 속성값이 서버로 데이터 전달 시 변수명이 됨 --%>
<%--      input 태그의 value 속성값이 서버로 데이터 전달 시 변수의 데이터 값이 됨--%>
      <input type="text" class="form-control" id="eng" name="eng" value="Bye">
    </div>
    <div class="mt-3">
      <label for="han" class="form-label">한글 : </label>
      <input type="text" class="form-control" id="han" name="han" value="잘 가">
    </div>
    <div class="mt-3 d-grid gap-2">
      <button type="submit" class="btn btn-primary">POST 방식 전송</button>
    </div>
  </form>

  <br><hr><br>

  <h2>2. 클라이언트의 요청 매개변수 읽기</h2>
  <form action="RequestParameter.jsp" method="POST">
    <div class="mt-3">
      <label for="id" class="form-label">아이디 : </label>
      <input type="text" class="form-control" id="id" name="id" value="">
    </div>
    <div class="mt-3">
      <label>성별 :
        <div class="form-check">
          <input type="radio" class="form-check-input" name="gender" id="man" value="man">
          <label for="man" class="form-check-label">남자</label>
        </div>
        <div class="form-check">
          <input type="radio" class="form-check-input" name="gender" id="woman" value="woman">
          <label for="woman" class="form-check-label">여자</label>
        </div>
      </label>
    </div>
    <div class="mt-3">
      <label>관심사항 :
        <div class="form-check">
          <input type="checkbox" class="form-check-input" id="eco" name="favo" value="eco">
          <label for="eco">경제</label>
        </div>
        <div class="form-check">
          <input type="checkbox" class="form-check-input" id="pol" name="favo" value="pol" checked="checked">
          <label for="pol">정치</label>
        </div>
        <div class="form-check">
          <input type="checkbox" class="form-check-input" id="ent" name="favo" value="ent">
          <label for="ent">연예</label>
        </div>
      </label>
    </div>
    <div class="mt-3">
      <label for="intro">자기소개 : </label>
      <textarea class="form-control" name="intro" id= "intro" cols="30" rows="5"></textarea>
    </div>
    <div class="mt-3">
      <button class="btn btn-primary" type="Submit">전송하기</button>
    </div>
  </form>

  <br><hr><br>

  <h2>3. HTTP 요청 헤더 정보 읽기</h2>
  <a href="RequestHeader.jsp">요청 헤더 정보 읽기</a>
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>











