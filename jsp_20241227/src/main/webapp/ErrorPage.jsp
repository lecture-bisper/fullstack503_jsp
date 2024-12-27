<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오전 11:17
  To change this template use File | Settings | File Templates.
--%>
<%--errorPage : 현재 jsp 페이지에서 오류가 발생했을 경우 오류를 처리하기 위한 페이지를 지정 --%>
<%-- 웹 브라우저의 url 은 그대로 유지하지만, 실제 페이지는 errorPage 로 지정한 웹 페이지가 열림 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" errorPage="IsErrorPage.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ErrorPage 로 예외처리</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%
  // 예외상황이 발생하는 소스코드
  int myAge = Integer.parseInt(request.getParameter("age")) + 10;
  out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
%>

</body>
</html>











