<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--  Person 클래스 import --%>
<%@ page import="bitc.fullstack503.jsp_20241230.Person" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>request 영역</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>포워드로 전달된 페이지</h2>
  <h4>RequestMain 파일의 리퀘스트 영역 속성</h4>
  <%
//    request 영역에 데이터를 저장하는 부분이 없음

//    request 영역에 저장된 데이터를 가져오기
//    forward를 통한 방식으로 페이지 이동 시 request 영역에 저장된 데이터가 살아 있음
//    request 내장 객체에 저장된 requestPerson 이라는 이름의 데이터를 가져옴
//    강제 타입 변환 필수
//    Person pPerson = (Person)(request.getAttribute("requestPerson"));
    Person pPerson = null;

//    forward가 아닌 방식으로 페이지 이동이 발생 시 request 영역에 저장된 데이터가 삭제 됨
//    a 태그를 통한 link로 페이지가 이동되어 request 영역에 저장된 데이터가 삭제 됨
    if (request.getAttribute("requestPerson") != null) {
      pPerson = (Person)(request.getAttribute("requestPerson"));
    }
  %>

  <ul>
<%--    가져온 데이터를 화면에 출력 --%>
    <li>String 객체 : <%=request.getAttribute("requestString")%></li>
<%--    <li>Person 객체 : <%=pPerson.getName()%>, <%=pPerson.getAge()%></li>--%>
    <%
      if (pPerson != null) {
        out.print("<li>Person 객체 : " + pPerson.getName() + ", " + pPerson.getAge() + "</li>");
      }
    %>
<%--    <li>Person 객체 : <%=(pPerson != null ? pPerson.getName() : "")%>, <%=(pPerson != null ? pPerson.getAge() : "")%></li>--%>
  </ul>

  <br><hr><br>

  <h4>매개변수로 전달된 값 출력하기</h4>
  <%
    request.setCharacterEncoding("UTF-8");
//    request 내장 객체에 저장된 이전 페이지에서 현재 페이지로 전달한 데이터를 가져옴
    out.println(request.getParameter("paramHan"));
    out.println(request.getParameter("paramEng"));
  %>
</div>
</body>
</html>











