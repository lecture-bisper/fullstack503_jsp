<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: 오후 12:02
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

<header>
  <div class="p-5 bg-secondary-subtle text-center">
    <h1 class="mt-3">Header 영역</h1>
    <p>include를 사용하지 않고 만든 웹 페이지</p>
  </div>
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand">Logo</a>
      <div class="me-auto">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a href="#" class="nav-link">링크 1</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">링크 2</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">링크 3</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<main class="mt-5">
  <div class="container">
    <div class="row">
      <div class="col-sm-2 border-end">
        <aside class="sidebar">
          <ul class="nav flex-column">
            <li class="nav-item"><a href="#" class="nav-link">링크 1</a></li>
            <li class="nav-item"><a href="#" class="nav-link">링크 2</a></li>
            <li class="nav-item"><a href="#" class="nav-link">링크 3</a></li>
          </ul>
        </aside>
      </div>
      <div class="col-sm-10">
        <section>
          <article>
            <table class="table table-striped table-hover">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>첫번째 제목</td>
                  <td>ㅇㅇ</td>
                  <td>10</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>두번째 제목</td>
                  <td>ㅇㅇ</td>
                  <td>10</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>세번째 제목</td>
                  <td>ㅇㅇ</td>
                  <td>10</td>
                </tr>
              </tbody>
            </table>
          </article>
        </section>
        <section>

        </section>
      </div>
    </div>
  </div>
</main>

<footer class="border-top p-5 mt-5 text-center">
  <p class="text-muted lead">made by fullstack503</p>
</footer>

</body>
</html>











