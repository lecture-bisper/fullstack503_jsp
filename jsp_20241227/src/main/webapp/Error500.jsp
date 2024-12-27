<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>

<%
  // request 객체의 메소드 getParameter()를 통해서 사용자가 입력한 데이터 age 를 받아와서 숫자 10과 연산을 진행
//  현재 페이지 실행 시 사용자가 입력하는 데이터가 없기 때문에 오류가 발생함
  int myAge = Integer.parseInt(request.getParameter("age")) + 10;
  out.println("<p>10년 후 당신의 나이는 " + myAge + "입니다.</p>");
%>
</body>
</html>











