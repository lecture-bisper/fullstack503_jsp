<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 3.
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>세션을 사용한 로그인 성공 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%
//  LoginProcess.jsp 페이지에서 세션에 저장한 내용을 가져오기
//  세션에 저장되는 모든 데이터는 Object 타입으로 저장되므로 데이터 출력 시 강제 타입 변환
  String userId = (String)session.getAttribute("userId");
  String userName = (String)session.getAttribute("userName");

  if (userId == null || userName == null) {
    response.sendRedirect("LoginForm.jsp");
  }
%>
<div class="container mt-5">
  <h2 class="text-center">세션을 사용한 로그인 성공 페이지</h2>

  <div class="mt-3 d-flex justify-content-end">
    <p class="me-3"><%=userName%>(<%=userId%>) 님 반갑습니다.</p>
    <a href="Logout.jsp" class="btn btn-info">로그아웃</a>
  </div>
</div>
</body>
</html>











