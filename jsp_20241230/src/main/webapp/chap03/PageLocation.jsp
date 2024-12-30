<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack503.jsp_20241230.Person" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>page 영역</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>이동 후 page 영역의 속성값 읽기</h2>

  <%
//    pageContext 내장 객체에 저장된 데이터 가져오기
//    pageContext 내장 객체에 저장된 데이터는 페이지 이동 시 모두 삭제됨
    Object pInteger = pageContext.getAttribute("pageInteger");
    Object pString = pageContext.getAttribute("pageString");
    Object pPerson = pageContext.getAttribute("pagePerson");
  %>

  <ul>
<%--    표현식을 사용하여 화면에 출력 --%>
<%--    삼항연산자를 사용하여 가져온 데이터가 null과 같으면 "값없음", 있으면 데이터 출력 --%>
    <li>Integer 객체 : <%=(pInteger == null) ? "값없음" : pInteger%></li>
    <li>String 객체 : <%=(pString == null) ? "값없음" : pString%></li>
    <li>Person 객체 : <%=(pPerson == null) ? "값없음" : ((Person)pPerson).getName()%></li>
  </ul>
</div>
</body>
</html>











