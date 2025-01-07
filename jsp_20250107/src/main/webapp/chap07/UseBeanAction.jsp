<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오후 4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>액션 태그 - useBean</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-3">
  <h2 class="text-center">액션 태그로 폼값 한번에 받기</h2>

  <jsp:useBean id="person" class="bitc.fullstack503.jsp_20250107.Person" scope="page"></jsp:useBean>
<%--  Form 을 통해서 클라이언트에서 서버로 전달되는 데이터를 useBean과 setProperty 를 통해서 한번에 입력받고자 할 경우 form의 input 태그 name 속성값과 useBean에서 사용하는 자바빈즈의 필드명이 동일해야 함 --%>
<%--  setProperty 의 property 값을 * 로 설정 --%>
  <jsp:setProperty name="person" property="*"></jsp:setProperty>

  <ul>
    <li>이름 : <jsp:getProperty name="person" property="name"></jsp:getProperty></li>
  <li>나이 : <jsp:getProperty name="person" property="age"></jsp:getProperty></li>
  </ul>
</div>
</body>
</html>











