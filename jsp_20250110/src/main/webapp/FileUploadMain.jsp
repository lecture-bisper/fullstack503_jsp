<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 10.
  Time: 오후 3:33
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%-- 파일 업로드를 위한 view 파일 --%>
<div class="container mt-5">
  <h2 class="text-center">파일 업로드하기</h2>
  
  <div class="mt-3">
    <div class="row">
      <div class="col-sm-4 mx-auto">
<%--        enctype 속성값을 반드시 multipart/form-data로 설정 --%>
        <form id="frm" action="./FileUploadProcess.jsp" method="post" enctype="multipart/form-data">
          <div class="mt-3">
            <label for="title" class="form-label">제목 : </label>
            <input type="text" class="form-control" id="title" name="title">
          </div>
          <div class="mt-3">
            <div class="form-check">
              <input type="checkbox" class="form-check-input" name="cate" value="사진" checked>
              <label class="form-check-label">사진</label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" name="cate" value="과제">
              <label class="form-check-label">과제</label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" name="cate" value="음원">
              <label class="form-check-label">음원</label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" name="cate" value="워드" >
              <label class="form-check-label">워드</label>
            </div>
          </div>
          <div class="mt-3">
            <label for="file" class="form-label">파일 : </label>
            <input type="file" class="form-control" id="file" name="ofile">
          </div>
          <div class="mt-3 d-grid gap-2">
            <button type="submit" class="btn btn-primary" id="btn-upload">업로드</button>
            <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>











