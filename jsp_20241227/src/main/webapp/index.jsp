<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>JSP - Hello World</title>

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
  <h2>디렉티브 태그</h2>
  <br>
  <ul>
    <li><a href="import.jsp" target="_blank" class="btn btn-link">import.jsp</a></li>
    <li><a href="Error500.jsp" target="_blank" class="btn btn-link">Error500.jsp</a></li>
    <li><a href="ErrorTryCatch.jsp" target="_blank" class="btn btn-link">ErrorTryCatch.jsp</a></li>
    <li><a href="ErrorPage.jsp" target="_blank" class="btn btn-link">ErrorPage.jsp</a></li>
    <li><a href="IncludeMain.jsp" target="_blank" class="btn btn-link">IncludeMain.jsp</a></li>
    <li><a href="NonInclude.jsp" target="_blank" class="btn btn-link">NonInclude.jsp</a></li>
    <li><a href="Include.jsp" target="_blank" class="btn btn-link">Include.jsp</a></li>
    <li><a href="ScriptElements.jsp" target="_blank" class="btn btn-link">ScriptElements.jsp</a></li>
    <li><a href="RequestMain.jsp" target="_blank" class="btn btn-link">RequestMain.jsp</a></li>
  </ul>

</div>

</body>
</html>