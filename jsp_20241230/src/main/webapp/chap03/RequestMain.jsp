<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- Person 클래스 import --%>
<%@ page import="bitc.fullstack503.jsp_20241230.Person" %>

<%
//  request 영역에서 데이터 저장하기
//  request 내장 객체에 문자열 데이터 저장
  request.setAttribute("requestString", "request 영역의 문자열");
//  request 내장 객체에 Person 클래스 타입의 객체 저장
  request.setAttribute("requestPerson", new Person("안중근", 31));
%>

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
  <h2>request 영역의 속성값 삭제하기</h2>

  <%
//    request 영역의 데이터 삭제
//    request 내장 객체에 저장된 데이터 중 requestString 이라는 이름을 가진 데이터 삭제
    request.removeAttribute("requestString");
//    request 내장 객체에 저장된 데이터 중 requestInteger 라는 이름의 가진 데이터 삭제
//    현재 request 내장 객체에 requestInteger 라는 이름의 데이터가 없으므로 무시 됨
    request.removeAttribute("requestInteger");
  %>

  <br><hr><br>

  <h2>request 영역의 속성값 읽기</h2>
  <%
//    request 영역에 저장된 데이터 가져오기
//    request 내장 객체에 저장된 데이터 중 requestPerson 이라는 이름의 데이터를 가져옴
//    강제 타입 변환 필수
    Person rPerson = (Person)(request.getAttribute("requestPerson"));
  %>

  <ul>
<%--    request 영역에 저장된 데이터 출력 --%>
<%--    표현식을 사용하여 데이터 출력 --%>
<%--    현재 request 내장 객체에 requestString 이라는 데이터가 없으므로 null 표시 --%>
    <li>String 객체 : <%=request.getAttribute("requestString")%></li>
    <li>Person 객체 : <%=rPerson.getName()%>, <%=rPerson.getAge()%></li>
  </ul>

  <br><hr><br>

  <h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>

<%--  <a href="RequestForward.jsp?paramHan=한글&paramEng=English" target="_blank">링크로 이동</a>--%>

  <%
//    getRequestDispatcher() : forward 사용 시 이동할 웹 페이지 주소 설정
//    forward() : request, response 객체를 매개변수로 가지고 페이지 이동
    request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
  %>

</div>
</body>
</html>











