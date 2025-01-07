<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>액션 태그 - param</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">포워드된 페이지에서 매개변수 확인</h2>

<%--  액션 태그의 useBean 을 사용하여 자바빈즈를 선언, request 영역에 저장 --%>
<%--  포워드 이전 페이지에서 useBean을 생성하고 request 영역에 저장했을 경우 이전 페이지의 자바빈즈 이름과 동일한 이름으로 선언하고 scope를 동일하게 맞추면 이전 페이지에서 선언한 자바 빈즈를 그대로 가져와서 사용함 --%>
  <jsp:useBean id="person" class="bitc.fullstack503.jsp_20250107.Person" scope="request" />

  <ul>
    <li><jsp:getProperty name="person" property="name"/></li>
    <li>나이 : <jsp:getProperty name="person" property="age"/></li>
<%--    이전 페이지에서 쿼리스트링을 통해서 전달한 데이터를 가져옴 --%>
    <li>본명 : <%=request.getParameter("param1")%></li>
<%--    이전 페이지에서 액션 태그 param을 통해서 전달한 데이터를 가져옴 --%>
    <li>출생 : <%=request.getParameter("param2")%></li>
    <li>특징 : <%=request.getParameter("param3")%></li>
  </ul>

  <jsp:include page="./inc/ParamInclude.jsp">
<%--    액션 태그 include 를 이용하여 현재 페이지에 포함할 페이지에 데이터 전달 --%>
    <jsp:param name="loc1" value="강원도 영월"></jsp:param>
    <jsp:param name="loc2" value="영월면"></jsp:param>
  </jsp:include>
</div>
</body>
</html>











