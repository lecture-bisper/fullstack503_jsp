<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>내장 객체</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<%--<h1><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>

<div class="container mt-5">
  <div>
    <h3>내장 객체</h3>

    <div class="list-group list-group-numbered">
      <a href="./chap02/ResponseMain.jsp" class="list-group-item list-group-item-action" target="_blank">ResponseMain.jsp</a>
      <a href="./chap02/OutMain.jsp" class="list-group-item list-group-item-action" target="_blank">OutMain.jsp</a>
      <a href="./chap02/ApplicationMain.jsp" class="list-group-item list-group-item-action" target="_blank">ApplicationMain.jsp</a>
      <a href="./chap02/Exception.jsp" class="list-group-item list-group-item-action" target="_blank">Exception.jsp</a>
    </div>
  </div>

  <br><hr><br>

  <div>
    <h3>내장 객체 영역</h3>

    <div class="list-group list-group-numbered">
      <a href="./chap03/PageContextMain.jsp" class="list-group-item list-group-item-action" target="_blank">PageContextMain.jsp</a>
      <a href="./chap03/RequestMain.jsp" class="list-group-item list-group-item-action" target="_blank">RequestMain.jsp</a>
      <a href="./chap03/SessionMain.jsp" class="list-group-item list-group-item-action" target="_blank">SessionMain.jsp</a>
      <a href="./chap03/SessionLocation.jsp" class="list-group-item list-group-item-action" target="_blank">SessionLocation.jsp 직접 접속</a>
      <a href="./chap03/ApplicationMain.jsp" class="list-group-item list-group-item-action" target="_blank">ApplicationMain.jsp</a>
      <a href="./chap03/ApplicationResult.jsp" class="list-group-item list-group-item-action" target="_blank">ApplicationResult.jsp 직접 접속</a>
    </div>
  </div>


</div>

</body>
</html>