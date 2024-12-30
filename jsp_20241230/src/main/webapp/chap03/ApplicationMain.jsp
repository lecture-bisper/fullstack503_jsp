<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--  HashMap, Map 을 사용하기 위해서 import --%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%-- 사용자가 생성한 Person 클래스 import --%>
<%@ page import="bitc.fullstack503.jsp_20241230.Person" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>애플리케이션 영역</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>application 영역의 공유</h2>

  <%
//    Map 타입의 객체 생성
    Map<String, Person> maps = new HashMap<>();
//    Map 타입의 객체에 데이터 저장
    maps.put("acter1", new Person("아이유", 32));
    maps.put("acter2", new Person("유인나", 42));
//    application 영역에 데이터 저장
    application.setAttribute("maps", maps);
  %>

  <div>
    <h4>application 영역에 속성이 저장되었습니다.</h4>
  </div>
</div>
</body>
</html>











