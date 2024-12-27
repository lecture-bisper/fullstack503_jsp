<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오전 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>디렉티브 태그 (include)</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%-- include 디렉티브를 사용하여 다른 파일의 내용을 모두 현재 페이지에 복사함 --%>
<%-- include 디렉티브는 다른 파일의 내용을 모두 복사하여 현재 페이지에 붙여넣기 하는 형태이기 때문에 최종적으로는 하나의 파일이 됨 --%>
<%-- 현재 파일에서 선언하지 않은 변수 및 메소드도 include 할 파일에 선언되어 있으면 현재 파일에서 호출할 수 있음 --%>
<%@ include file="IncludeFile.jsp" %>

<%
  out.println("오늘 날짜 : " + today);
  out.println("<br>");
  out.println("내일 날짜 : " + tomorrow);
%>

</body>
</html>











