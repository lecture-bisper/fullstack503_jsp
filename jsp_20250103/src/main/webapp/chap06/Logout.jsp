<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 3.
  Time: 오전 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>세션을 사용한 로그인 정보 파기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function() {
      setTimeout(function () {
        location.href = "./LoginForm.jsp";
      }, 5000);
    });
  </script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">로그아웃 페이지 (세션 삭제)</h2>

  <%
//    세션 영역에 저장된 데이터를 삭제
    session.removeAttribute("userId");
    session.removeAttribute("userName");

//    세션 영역의 모든 데이터를 삭제
    session.invalidate();
  %>
  <div class="mt-3 text-center">
    <p>로그 아웃 되었습니다.</p>
    <p>5초 후 자동으로 Login 페이지로 이동합니다.</p>
    <a href="LoginForm.jsp" target="_self" class="btn btn-link">로그인 페이지로 이동</a>
  </div>
</div>
</body>
</html>











