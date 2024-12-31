<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 31.
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>쿠키값 확인하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <div>
    <h2>쿠키값 확인하기(쿠키가 생성된 이후의 페이지)</h2>
    <%
//      현재 웹 서버에 두 번째로 요청을 한 상태 (CookieResult.jsp 파일에 대한 요청)
//      두 번째 이후로는 서버에 요청 시 클라이언트에 저장된 쿠키 정보를 서버로 함께 전달
//      웹 서버는 클라이언트에서 전달한 데이터 중 쿠키 정보를 모두 가져옴
      Cookie[] cookies = request.getCookies();

      if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
          String cookieName = cookies[i].getName();
          String cookieValue = cookies[i].getValue();
          out.println(String.format("쿠키명 : %s - 쿠키값 : %s<br>", cookieName, cookieValue));
        }
      }
    %>
  </div>
</div>
</body>
</html>











