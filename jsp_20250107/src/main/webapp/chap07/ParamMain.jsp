<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오후 4:24
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

<%
//  한글을 제대로 표현하기 위한 세팅
  request.setCharacterEncoding("UTF-8");
//  변수 선언 및 데이터 저장
  String pValue="영화배우";
%>
<div class="container mt-5">
  <h2 class="text-center">액션태그 param 사용하기</h2>

<%--  액션태그의 useBean을 사용하여 자바빈즈 생성, request 영역에 저장 --%>
  <jsp:useBean id="person" class="bitc.fullstack503.jsp_20250107.Person" scope="request" />
<%--  생성된 자바빈즈의 필드에 값 설정 --%>
  <jsp:setProperty name="person" property="name" value="유재석" />
  <jsp:setProperty name="person" property="age" value="55" />

<%--  액션 태그의 forward 를 사용하여 페이지 이동 --%>
<%--  포워드할 url뒤에 쿼리스트링을 통해서 데이터를 전달 --%>
  <jsp:forward page="ParamForward.jsp?param1=원빈">
<%--    액션태그 param을 사용하여 데이터를 전달 --%>
    <jsp:param name="param2" value="강원도" />
    <jsp:param name="param3" value="<%=pValue%>"></jsp:param>
  </jsp:forward>
</div>

</body>
</html>











