<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 7.
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>액션 태그 - forward</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%-- forward 를 통해서 이동한 페이지 --%>
<div class="container mt-5">
  <h2 class="text-center">포워드 결과(ForwardSub.jsp)</h2>

  <div class="mt-3">
    <ul class="list-group">
<%--      page 영역에 저장된 데이터 가져오기 --%>
<%--      page 영역에 저장된 데이터는 페이지 이동 시 삭제 됨 --%>
      <li class="list-group-item list-group-item-action">page 영역 : <%=pageContext.getAttribute("pAttr")%></li>
<%--      request 영역에 저장된 데이터 가져오기--%>
<%--      request 영역에 저장된 데이터는 forward로 페이지 이동 시 데이터 유지 --%>
<%--      redirect 로 페이지 이동 시 데이터 삭제 --%>
      <li class="list-group-item list-group-item-action">request 영역 : <%=request.getAttribute("rAttr")%></li>
    </ul>
  </div>
</div>

</body>
</html>











