<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" errorPage="Exception.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - Application</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>web.xml 에 설정한 내용 읽어오기</h2>

<%--  getInitParameter : web.xml 파일에 입력된 param-name 속성과 연동된 값을 가져옴 --%>
<%--  주로 서버 설정 내용을 입력하여 사용함 --%>
  <h4>초기화 변수 : <%=application.getInitParameter("INIT_PARAM")%></h4>
  <br>

  <h2>서버의 물리적 경로 가져오기</h2>
  <h4>application 내장 객체 : <%=application.getRealPath("/chap02")%></h4>
  <br>

  <h2>선언부에서 application 내장 객체 사용하기</h2>
  <%!
    public String useImplicitObject() {
//      return this.getServletContext().getRealPath("/");
      return null;
    }

    public String useImplicitObject(ServletContext app) {
      return app.getRealPath("/chap02");
    }
  %>

  <ul>
    <li>this 사용 : <%=useImplicitObject()%></li>
    <li>내장 객체를 인수로 전달 : <%=useImplicitObject(application)%></li>
  </ul>

  <%
    int a = 10;
    int b = 0;
    int result = a / b; // 오류 발생, 0으로 나눌 수 없음
    out.print("<p>a + b = " + result + "입니다.");
  %>
</div>
</body>
</html>











