<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 26.
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%--디렉티브 태그 사용, JSP 를 사용하기 위한 기본 설정 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <%!
    // 스크립트 태그, 선언부
//    자바 변수 선언, 메소드 선언
    String str1 = "JSP";
    String str2 = "안녕하세요!";
  %>
</head>
<body>

<div class="container mt-5">
<%--  스크립트 태그, 표현식 --%>
<%--  자바 코드의 변수값이나 메소드의 리턴값을 화면(웹화면)에 출력 --%>
  <h2>처음 만들어보는 <%=str1%>
  </h2>

  <p>
    <%
      // 스크립트 태그, 스크립틀릿
//      일반적인 자바 소스코드, 연산식
      out.println(str2 + str1 + "입니다. 열공합시다.^^*");
    %>
  </p>
</div>
</body>
</html>











