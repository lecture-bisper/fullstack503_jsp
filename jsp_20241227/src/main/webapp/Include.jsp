<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%-- include 디렉티브 태그를 사용하여 화면 구성--%>

<%@ include file="header.jsp" %>

<main class="mt-5">
  <div class="container">
    <div class="row">
      <div class="col-sm-2 border-end">
<%--        사이드바--%>
        <%@ include file="sidebar.jsp" %>
      </div>
      <div class="col-sm-10">
<%--        메인 콘텐츠--%>
        <section>
<%--          테이블 들어갈 부분--%>
          <%@ include file="phoneBook.jsp" %>
        </section>
        <section>

        </section>
      </div>
    </div>
  </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>











