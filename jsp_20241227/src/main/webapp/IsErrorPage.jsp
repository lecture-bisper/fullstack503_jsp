<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>
<%-- isErrorPage : 현재 페이지가 다른 웹 페이지에서 발생한 오류를 처리하기 위한 페이지임을 나타내는 속성, 기본값 false --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isErrorPage="true" trimDirectiveWhitespaces="true" %>
<%-- trimDirectiveWhitespaces : jsp파일에서 디렉티브 태그를 사용 시 html 태그로 변환되는 도중 디렉티브 태그 위치가 공백기호로 표시됨 --%>
<%-- 이러한 공백기호 부분을 제거하는 옵션 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>예외 처리 페이지(isError 속성 사용)</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>서비스 중 일시적인 오류가 발생하였습니다</h2>
  <p>
<%--    errorPage 속성을 지정한 웹 페이지에서 오류가 발생할 경우 Exception 객체를 자동으로 isErrorPage 속성을 지정한 페이지로 전달함 --%>
<%--    exception 객체는 jsp의 내장 객체이므로 사용자가 선언할 필요 없음(자동 선언됨) --%>
    오류명 : <%=exception.getClass().getName()%><br>
    오류메시지 : <%=exception.getMessage()%>
  </p>
</div>
</body>
</html>











