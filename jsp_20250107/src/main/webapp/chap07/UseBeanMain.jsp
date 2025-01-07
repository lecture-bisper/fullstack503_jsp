<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>액션 태그 - useBean</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">useBean 액션 태그</h2>
  <hr>

  <div class="mt-3">
    <h3 class="text-center">자바빈즈 생성하기</h3>

<%--    bitc.fullstack503.jsp_20250107.Person 클래스 타입의 객체 생성, request 영역에 저장 --%>
    <jsp:useBean id="person" class="bitc.fullstack503.jsp_20250107.Person" scope="request"></jsp:useBean>
  </div>

  <div class="mt-3">
    <h3 class="text-center">setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>

    <jsp:setProperty name="person" property="name" value="임꺽정"></jsp:setProperty>
    <jsp:setProperty name="person" property="age" value="18"></jsp:setProperty>
  </div>

  <div class="mt-3">
    <h3 class="mt-3">getProperty 액션 태그로 자바빈즈 속성 읽기</h3>

    <ul>
      <li>이름 : <jsp:getProperty name="person" property="name"></jsp:getProperty></li>
      <li>나이 : <jsp:getProperty name="person" property="age"></jsp:getProperty></li>
<%--      useBean 으로 생성한 자바빈즈 객체를 표현식으로 출력할 수 있음--%>
      <li><%=person.getName()%>, <%=person.getAge()%></li>
    </ul>
  </div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>











