<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오후 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - request</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>3. 요청 헤더 정보 출력하기</h2>
  <%
    // getHeaderNames() : request 내장 객체가 가지고 있는 헤더 이름을 모두 가져옴
//    Enumeration : 반복자로 객체의 내용을 반복 출력할 수 있는 데이터 타입
//    반복자를 사용하는 이유는 사용 방법을 통일하여 유지보수를 쉽게 하기 위함
    Enumeration<String> headers = request.getHeaderNames();

//    hasMoreElements() : 출력할 데이터가 있는지 확인하는 메소드, 있으면 true, 없으면 false
    while (headers.hasMoreElements()) {
//      nextElement() : 데이터 하나를 Enumeration 타입의 변수에서 가져옴
      String headerName = headers.nextElement();
//      getHeader() : request 내장 객체가 가지고 있는 헤더 정보 중 지정한 이름의 헤더정보를 가져옴
      String headerValue = request.getHeader(headerName);
      out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br>");
    }
  %>

  <p>이 파일을 직접 실행하면 referer 정보를 출력되지 않습니다.</p>
</div>
</body>
</html>











