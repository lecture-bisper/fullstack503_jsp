<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--사용자가 생성한 Person 클래스를 import 함 --%>
<%@ page import="bitc.fullstack503.jsp_20241230.Person" %>

<%
  // pageContext 내장 객체를 이용하여 page 영역에 데이터 저장
//  pageInteger 라는 이름으로 정수 1000을 저장
  pageContext.setAttribute("pageInteger", 1000);
//  pageString 이라는 이름으로 문자열 저장
  pageContext.setAttribute("pageString", "페이지 영역의 문자열");
//  pagePerson 이라는 이름으로 Person 클래스 타입의 객체 저장
  pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page 영역</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>page 영역의 속성값 읽기</h2>
  <%
    // 스크립틀릿을 사용하여 page 영역에 저장된 데이터를 가져오기
//    pageContext 내장 객체에 저장된 pageInteger의 데이터를 가져옴, 강제 타입 변환 필수
    int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
//    pageContext 내장 객체에 저장된 pageString의 데이터를 가져옴, 강제 타입 변환
    String pString = (String)(pageContext.getAttribute("pageString"));
//    pageContext 내장 객체에 저장된 pagePerson의 데이터를 가져옴, 강제 타입 변환
    Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
  %>

  <ul>
<%--    표현식을 사용하여 변수의 내용 출력 --%>
    <li>Integer 객체 : <%=pInteger%></li>
    <li>String 객체 : <%=pString%></li>
    <li>Person 객체 : <%=pPerson.getName()%>, <%=pPerson.getAge()%></li>
  </ul>
  
  <br><hr><br>
  
  <h2>include 된 파일에서 page 영역 읽어오기</h2>
<%--  include 디렉티브 태그를 사용하여 PageInclude.jsp 파일을 현재 파일에 포함 --%>
  <%@ include file="PageInclude.jsp"%>

  <br><hr><br>

  <h2>페이지 이동 후 page 영역 읽어오기</h2>
  <a href="PageLocation.jsp" class="btn btn-link">PageLocation.jsp 바로가기</a>
</div>

</body>
</html>











