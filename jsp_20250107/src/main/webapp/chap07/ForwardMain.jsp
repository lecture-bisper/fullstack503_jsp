<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>액션태그 - forward</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%
//  page 영역에 데이터 저장
  pageContext.setAttribute("pAttr", "김유신");
//  request 영역에 데이터 저장
  request.setAttribute("rAttr", "계백");
%>

<div class="container mt-5">
  <h2 class="text-center">액션 태그를 이용한 포워딩(ForwardMain.jsp)</h2>

<%--  액션 태그를 이용한 forward --%>
  <jsp:forward page="./ForwardSub.jsp"></jsp:forward>

<%--  request 내장객체의 getRquestDispatcher() 로 forward --%>
<%--  <%--%>
<%--    request.getRequestDispatcher("./ForwardSub.jsp").forward(request, response);--%>
<%--  %>--%>
</div>
</body>
</html>











