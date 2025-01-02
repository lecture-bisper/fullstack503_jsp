<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 2.
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Statement로 데이터 조회하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

  <div class="container mt-5">
    <h2 class="text-center">데이터 조회하기</h2>

    <div class="mt-3">
      <div class="row">
        <div class="col-sm-4 mx-auto">
          <form action="SelectProcess.jsp" method="get">
            <div class="mt-3">
              <label for="user-id" class="form-label">검색할 ID : </label>
              <input type="text" class="form-control" id="user-id" name="userId" placeholder="정보를 검색할 사용자 ID를 입력하세요">
            </div>
            <div class="mt-3 d-flex justify-content-end">
              <button type="submit" class="btn btn-primary">검색</button>
            </div>
          </form>
        </div>
      </div>
    </div>

  </div>
</body>
</html>











