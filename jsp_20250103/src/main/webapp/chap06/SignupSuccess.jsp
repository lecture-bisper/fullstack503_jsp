<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 3.
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 가입 성공 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function () {
      setTimeout(function () {
        location.href = './LoginForm2.jsp';
      }, 5000);
    });
  </script>
</head>
<body>
<%
  String userName = (String)session.getAttribute("userName");
  session.removeAttribute("userName");
  session.invalidate();
%>
  <div class="container mt-5">
    <h2 class="text-center">회원 가입 성공</h2>

    <div class="mt-3 text-center">
      <p><%=userName%> 님 회원 가입에 성공했습니다.</p>
      <p>5초 후 로그인 페이지로 이동합니다.</p>
    </div>
  </div>
</body>
</html>











