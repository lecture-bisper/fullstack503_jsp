<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>액션태그 include</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%
//  포함시킬 외부 파일의 경로를 변수에 저장
  String outerPath1 = "./inc/OuterPage1.jsp";
  String outerPath2 = "./inc/OuterPage2.jsp";

//  page 내장객체와 request 내장객체에 데이터 저장
  pageContext.setAttribute("pAttr", "동명왕");
  request.setAttribute("rAttr", "온조왕");
%>

<div class="container mt-5">
  <h2 class="text-center">지시어와 액션 태그 동작 방식 비교</h2>

  <hr>

  <div class="mt-3">
    <h3 class="text-center">지시어로 페이지 포함하기</h3>

<%--    디렉티브 태그를 사용한 include --%>
    <%@ include file="./inc/OuterPage1.jsp"%>
<%--    디렉티브 태그의 include 사용 시 jsp 표현식의 사용은 불가능함 --%>
<%--    <%@ include file="<%=outerPath1%>"%>--%>
<%--    현재 파일인 IncludeMain.jsp 에서 선언한 변수가 아닌 외부 파일인 OuterPage1.jsp 에서 선언한 파일을 IncludeMain.jsp 파일에서 호출하여 사용함 --%>
<%--    디렉티브 태그의 include는 현재 파일에 외부 파일을 복사&붙여넣기한 형태이므로 1개의 파일로 인식함 --%>
    <p>외부 파일에 선언한 변수 : <%=newVar1%></p>
  </div>

  <br><hr><br>

  <div class="mt-3">
    <h3 class="text-center">액션 태그로 페이지 포함하기</h3>

<%--    액션태그의 include를 사용하여 현재 파일에 외부 파일을 포함 --%>
<%--    액션태그의 include는 외부 파일로 이동하여 연산을 진행하고 그 결과만 현재 파일에 포함시킴 --%>
    <jsp:include page="./inc/OuterPage2.jsp"></jsp:include>
<%--    액션태그의 include는 jsp의 표현식 사용이 가능함 --%>
    <jsp:include page="<%=outerPath2%>"></jsp:include>
<%--    액션태그의 include 사용 시 외부 파일에 선언한 변수를 가져올 수 없음 --%>
<%--    <p>외부 파일에 선언한 변수 : <%=newVar2%></p>--%>
  </div>
</div>

</body>
</html>











