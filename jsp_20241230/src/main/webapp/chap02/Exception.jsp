<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isErrorPage="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - Exception</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">Exception 내장 객체 사용하기</h2>

  <%
    // Exception 부분은 page 디렉티브 태그에서 isErrorPage 속성값이 true 이거나, web.xml 에서 오류처리 페이지로 설정했을 경우에 사용할 수 있음
    int status = response.getStatus();
    System.out.println(status);

    if (status == 404) {
      out.println("<h4>404 오류가 발생했습니다.</h4>");
      out.println("<p>파일 경로를 확인해주세요<p>");
    }
    else if (status == 405) {
      out.println("<h4>405 오류가 발생했습니다.</h4>");
      out.println("<p>요청 방식(method)를 확인해주세요<p>");
    }
    else if (status == 500) {
      out.println("<h4>500 오류가 발생했습니다.</h4>");
      out.println("<p>소스 코드에 오류가 없는지 확인해주세요<p>");
    }
  %>
</div>
</body>
</html>











