<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">액션 태그 사용하기</h2>

  <div class="list-group">
    <a href="./chap07/IncludeMain.jsp" target="_blank" class="list-group-item list-group-item-action">IncludeMain.jsp</a>
    <a href="./chap07/ForwardMain.jsp" target="_blank" class="list-group-item list-group-item-action">ForwardMain.jsp</a>
    <a href="./chap07/UseBeanMain.jsp" target="_blank" class="list-group-item list-group-item-action">UseBeanMain.jsp</a>
    <a href="./chap07/UseBeanForm.jsp" target="_blank" class="list-group-item list-group-item-action">UseBeanForm.jsp</a>
    <a href="./chap07/ParamMain.jsp" target="_blank" class="list-group-item list-group-item-action">ParamMain.jsp</a>
  </div>
</div>
<%--<h1><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
</body>
</html>