<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- List 컬렉션을 사용하기 위해서 import --%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>세션 영역</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2>페이지 이동 후 session 영역의 속성</h2>
  <%
//    세션 영역에 저장된 lists 라는 이름의 데이터를 가져옴
//    강제 타입 변환 필수
//    만약 웹 브라우저를 완전히 닫은 상태에서 다시 현재 페이지로 바로 접속 시 세션 영역에 저장된 데이터는 모두 삭제 됨
    List<String> lists = (List<String>)(session.getAttribute("lists"));

//    반복문을 사용하여 List에 저장된 모든 내용을 출력
    for (String item : lists) {
      out.print("<p>" + item + "</p>");
    }
  %>
</div>
</body>
</html>











