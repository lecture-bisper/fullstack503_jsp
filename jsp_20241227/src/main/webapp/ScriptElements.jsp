<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 스크립트 태그 : jsp 파일 안에서 자바 소스코드를 입력하는 것을 의미 --%>
<%-- 스크립트 태그는 jsp 파일의 어떤 위치에 사용해도 상관없음 --%>
<%-- 스크립트 태그의 선언부는 주로 html 태그 이전에 많이 사용 --%>
<%-- 스크립틀릿과 표현식은 body 태그 안에서 html 태그들과 함께 사용 --%>

<%-- 선언부 : 변수와 메소드를 선언하는 부분, 클래스의 필드 및 메소드를 선언하는 곳 --%>
<%--  <%! %> 기호를 사용함 --%>

<%-- 표현식 : 선언부 및 스크립틀릿에서 선언한 변수나 메소드의 반환값을 출력하는 곳 --%>
<%-- 스크립틀릿의 out.print() 를 통해서 html과 변수를 합하여 출력하는 것과 동일한 기능 --%>
<%-- 기본적으로 html 안에서 사용하는 방식이기 때문에 스크립트릿에서 html 을 출력하는 것보다 간단함 --%>
<%-- <%= %> 기호를 사용함 --%>
<%-- 스크립틀릿 : 일반적인 자바 코드를 입력하는 곳, 메소드는 선언할 수 없고 변수만 선언 가능 --%>
<%-- 각종 연산을 진행하는데 사용함 --%>
<%-- <% %> 기호를 사용함 --%>

<%-- 선언부에서 메소드 선언 --%>
<%!
  public int add(int num1, int num2) {
    return num1 + num2;
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>스크립틀릿 사용하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%-- 스크립틀릿에서 변수 선언과 동시에 선언부에서 선언한 메소드를 호출하여 사용 --%>
<%-- 스크립틀릿은 html 사이에서 여러번 사용해도 상관없음 --%>
<%-- 여러개의 스크립틀릿은 웹에서 하나로 합쳐져서 사용됨 --%>
<%
  int result = add(10, 20);
%>

<div class="container mt-5">
  <p>덧셈 결과 1 : <%=result%></p>
  <p>덧셈 결과 2 : <%=add(30, 40)%></p>

  <%-- 두번째 스크립틀릿을 선언하고 사용 --%>
  <%
    out.println("<p>덧셈 결과 3 : " + add(50, 60) + "</p>");
  %>
</div>

</body>
</html>











