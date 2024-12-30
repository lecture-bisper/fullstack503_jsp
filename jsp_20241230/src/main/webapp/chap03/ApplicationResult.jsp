<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- Map, Set 타입의 사용을 위해 import --%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>

<%-- Person 클래스 import --%>
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
  <h2>application 영역의 속성 읽기</h2>
  <%
//    데이터를 저장한 Map 타입 객체 생성
    Map<String, Person> maps = null;

//    application 내장 객체에 지정한 이름의 데이터가 있으면 데이터 가져오기
    if (application.getAttribute("maps") != null) {
      maps = (Map<String, Person>)application.getAttribute("maps");
//      HashMap 타입의 데이터에서 key만 모두 가져옴
      Set<String> keys = maps.keySet();

      for (String key : keys) {
        Person person = maps.get(key);
        out.print(String.format("<h4>이름 : %s, 나이 : %d</h4>", person.getName(), person.getAge()));
      }
    }
    else {
//      application 내장 객체에 데이터가 없을 경우
      out.println("application 내장 객체에 저장된 내용이 없습니다.");
    }
  %>
</div>
</body>
</html>











