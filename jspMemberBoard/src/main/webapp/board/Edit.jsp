<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. 필요한 클래스 import --%>
<%-- 3. DAO 를 사용하여 데이터베이스 연결 --%>
<%-- 4. DAO에서 제공하는 메소드를 사용하여 지정한 게시물 정보 가져오기 --%>
<%-- 5. 데이터베이스 연결 종료 --%>
<%-- 6. 가져온 게시물 정보를 html에 출력 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDTO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDAO" %>

<%-- 세션에 저장된 값을 확인하여 로그인 여부를 체크하는 LoginCheck.jsp 파일을 include --%>
<jsp:include page="./login/LoginCheck.jsp"></jsp:include>

<%
//  수정 페이지에서 필요한 게시물 번호를 클라이언트에서 가져옴
  int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));

  JSPBoardDAO dao = new JSPBoardDAO();
  dao.dbOpen();

//  지정한 게시물 번호의 게시물 데이터를 가져옴
  JSPBoardDTO board = dao.selectBoardDetail(boardIdx);

  dao.dbClose();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원제 게시판 수정 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <style>
      .input-group > span.input-group-text { width: 75px; }
  </style>

  <script>
    $(document).ready(function () {

      // 취소 버튼 클릭 시 이전 페이지로 이동
      $("#btn-cancel").on("click", function() {
        var confirmed = confirm("내용 수정을 취소하시겠습니까?");

        if (confirmed) {
          history.back();
        }
      });

      // 수정 버튼 클릭 시 form 태그의 submit 이벤트 발생
      $("#btn-edit").on("click", function() {
        var confirmed = confirm("수정하시겠습니까?");

        if (confirmed) {
          var frm = $("#frm")[0];
          frm.submit();
        }
      });
    });
  </script>
</head>
<body>

<%@ include file="./layout/Header.jsp" %>

<%@ include file="./layout/Menu.jsp" %>

<main class="container mt-5">
  <section>
    <form id="frm" action="./EditProcess.jsp" method="post">
      <div class="row mt-3">
        <div class="col-sm-3">
          <div class="input-group">
            <span class="input-group-text">글번호</span>
            <input type="number" class="form-control" id="board-idx" name="boardIdx" readonly value="<%=board.getBoardIdx()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text">제목</span>
            <input type="text" class="form-control" id="board-title" name="boardTitle" value="<%=board.getBoardTitle()%>" placeholder="수정할 제목을 입력하세요">
          </div>
        </div>
        <div class="col-sm-3">
          <div class="input-group">
            <span class="input-group-text">조회수</span>
            <input type="number" class="form-control" id="board-view-count" readonly value="<%=board.getBoardViewCount()%>">
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text">등록일</span>
            <input type="datetime-local" class="form-control" id="board-create-date" readonly value="<%=board.getBoardCreateDate()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text">작성자</span>
            <input type="text" class="form-control" id="board-create-id" readonly value="<%=board.getBoardCreateId()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text">수정일</span>
            <input type="datetime-local" class="form-control" id="board-update-date" readonly value="<%=board.getBoardUpdateDate()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text">추천수</span>
            <input type="number" class="form-control" id="board-like-count" readonly value="<%=board.getBoardLikeCount()%>">
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text">내용</span>
            <textarea class="form-control" name="boardContent" id="board-content" rows="10" placeholder="수정할 내용을 입력해주세요"><%=board.getBoardContent()%></textarea>
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm d-flex justify-content-end">
          <button type="button" class="btn btn-warning" id="btn-edit">수정</button>
          <button type="reset" class="btn btn-secondary ms-2" id="btn-cancel">취소</button>
        </div>
      </div>
    </form>
  </section>
</main>

<%@ include file="./layout/Footer.jsp"%>

</body>
</html>











