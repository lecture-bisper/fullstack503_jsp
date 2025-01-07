<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OuterPage 1</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">외부 파일 1</h2>
  <%
//    스크립틀릿을 사용하여 외부 파일에 변수 선언
    String newVar1 = "고구려 세운 동명왕";
  %>

  <ul class="list-group">
<%--    page 내장 객체에 저장한 데이터 출력 --%>
    <li class="list-group-item list-group-item-action">page 영역 속성 : <%=pageContext.getAttribute("pAttr")%></li>
<%--    request 내장 객체에 저장한 데이터 출력--%>
    <li class="list-group-item list-group-item-action">request 영역 속성 : <%=request.getAttribute("rAttr")%></li>
  </ul>
</div>

</body>
</html>











