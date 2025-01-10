<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 데이터를 가져오기 --%>
<%-- 2. 필요한 클래스 import --%>
<%-- 3. DAO로 데이터베이스 연결 --%>
<%-- 4. DAO에서 제공하는 메소드를 사용하여 지정한 게시글 정보 가져오기 --%>
<%-- 5. 데이터베이스 연결 종료 --%>
<%-- 6. 가져온 게시글 정보를 html에 출력하기 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDTO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDAO" %>

<%
//  클라이언트에서 전달한 게시물 번호를 가져옴
//  클라이언트에서 전달되는 모든 데이터는 문자열 타입이기 때문에 게시물 번호를 숫자 타입으로 변환
  int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));

  JSPBoardDAO dao = new JSPBoardDAO();
  dao.dbOpen();

//  조회수 증가 실행, 지정한 게시물의 정보를 가져오기 전에 먼저 실행
  dao.updateViewCount(boardIdx);
//  지정한 게시물의 정보 가져오기
  JSPBoardDTO board = dao.selectBoardDetail(boardIdx);

  dao.dbClose();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원제 게시판 상세 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <style>
    .caption1 { width: 75px; }
  </style>
  <script>
    $(document).ready(function () {
      // 목록 버튼 클릭 시 게시물 목록 페이지로 이동
      $("#btn-list").on("click", function() {
        location.href = './List.jsp';
      });

      // 수정 버튼 클릭 시 게시물 수정 페이지로 이동
      $("#btn-edit").on("click", function() {
        // html 에 출력된 게시물 번호를 자바스크립트로 가져옴
        var boardIdx = $("#board-idx").val();
        // 수정 시에도 게시물 정보가 필요하기 때문에 게시물 번호를 파라미터로 사용함
        location.href = './Edit.jsp?boardIdx=' + boardIdx;
      });

      // 삭제 버튼 클릭 시 삭제 처리 페이지로 이동
      $("#btn-delete").on("click", function() {
        // 삭제 여부를 묻는 대화창 출력
        var confirmed = confirm("삭제 하시겠습니까?");

        // 사용자의 삭제 여부에 따라 동작
        if (confirmed) {
          // id 값이 frm인 태그를 검색하여 가져옴
          var frm = $("#frm")[0];
          // form 태그의 action 속성을 값을 변경
          frm.action = "./DeleteProcess.jsp";
          // 자바스크립트를 사용하여 form 태그의 submit 이벤트 발생
          frm.submit();
        }
      });

      // 추천 버튼
      // ajax를 사용하여 자바스크립트가 직접 서버와 데이터 통신
      $("#btn-like").on("click", function() {
        var boardIdx = $("#board-idx").val();

        // ajax : 자바스크립트의 비동기 통신 기술
        // 웹에서 클라이언트가 서버와 통신(데이터 주고 받기)을 하는 방법은 form 태그를 사용하여 데이터를 서버로 전달
        // 자바스크립트의 ajax 를 사용하게 되면 자바스크립트가 직접 서버와 통신을 진행함
        // form 태그를 사용하여 서버와 데이터 통신을 하면 같은 페이지를 출력하더라도 화면을 새로 그려야 함
        // 자바스크립트는 html을 실시간으로 조작할 수 있으므로 필요한 부분만 수정하는 것이 가능함
        // 자바스크립트의 ajax 를 사용하게 되면 서버와 통신 후 전달받은 데이터를 화면에 출력할 때 전체화면을 다시 그릴 필요없이 수정될 부분만 새로 그리면 됨
        // ajax 통신 시 주로 json 방식으로 데이터를 전달받음

        // json : JavaScript Object Notation 의 줄임말
        // 자바스크립트의 object 타입을 흉내낸 데이터 타입
        // 현재는 데이터 통신 시 주로 사용하는 방식

        // 자바에서 json을 사용하려면 추가 라이브러리(Gson)가 필요함

        // jquery의 ajax 함수 설명
        // url : 서버로 요청할 주소
        // type : 서버로 데이터 전송 시 통신 방법(GET, POST)
        // data : 서버로 전달할 데이터, javascript의 object 타입으로 설정, JSP에서 getParameter()로 가져옴
        //    서버로 전달할 데이터가 없을 경우 생략 가능
        // dataType : 서버에서 클라이언트로 데이터 전달 시 사용할 데이터 타입(text,html,json)
        //    생략할 경우 자바스크립트가 자동으로 추정
        //    text 는 서버에서 전달하는 데이터가 문자열일 경우 사용
        //    html 은 서버에서 전달하는 데이터가 html 문서일 경우
        //    json 은 가장 많이 사용하는 방식, 자바스크립트의 object 타입을 흉내낸 데이터 타입일 경우
        //      자바에서는 HashMap과 비슷함
        // success : 서버와 정상적으로 통신이 성공했을 경우 자동 실행되는 콜백함수
        // error : 서버와 통신이 실패했을 경우 자동 실행되는 콜백함수

        // async : 서버와 통신을 동기화 방식으로 진행, true/false
        // timeout : 서버와 통신 시 요청 제한 시간, 1/1000 초로 입력
        // beforeSend : 서버와 통신을 진행하기 직전에 먼저 실행하는 콜백함수
        // complete : 서버와 통신 후 success, error 콜백함수 실행 이후에 자동 실행되는 콜백함수

        $.ajax({
          url: "./AjaxLikeProcess.jsp",
          type: "POST",
          data: {boardIdx: boardIdx},
          dataType: "text",
          // 서버와 통신 성공 시 데이터만 가져옴
          success: function(data) {
            // 서버에서 받아온 json 문자열의 앞뒤 공백을 제거
            var resData = data.trim();
            // 자바스크립트에서 제공하는 JSON 관련 함수를 사용하여 json 문자열을 자바스크립트 object 타입으로 변환
            var resDataObj = JSON.parse(resData);

            if (resDataObj.result == "success") {
              alert("추천하였습니다.");
              $("#board-like-count").val(resDataObj.data);
            }
            else {
              alert("추천에 실패하였습니다.");
            }
          },
          error: function() {
            alert("통신 중 오류가 발생했습니다.");
          }
        });
      });
    });
  </script>

</head>
<body>

<%@ include file="./layout/Header.jsp" %>

<%@ include file="./layout/Menu.jsp" %>

<%-- 가져온 게시물 정보를 html 화면에 출력--%>
<main class="container mt-5">
  <section>
    <form id="frm" method="post">
      <div class="row mt-3">
        <div class="col-sm-3">
          <div class="input-group">
            <span class="input-group-text caption1">글번호</span>
            <input type="text" class="form-control" id="board-idx" name="boardIdx" readonly value="<%=board.getBoardIdx()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">제목</span>
            <input type="text" class="form-control" id="board-title" name="boardTitle" readonly value="<%=board.getBoardTitle()%>">
          </div>
        </div>
        <div class="col-sm-3">
          <div class="input-group">
            <span class="input-group-text caption1">조회수</span>
            <input type="number" class="form-control" id="board-view-count" name="boardViewCount" readonly value="<%=board.getBoardViewCount()%>">
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">등록일</span>
            <input type="datetime-local" class="form-control" id="board-create-date" name="boardCreateDate" readonly value="<%=board.getBoardCreateDate()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">작성자</span>
            <input type="text" class="form-control" id="board-create-id" name="boardCreateId" readonly value="<%=board.getBoardCreateId()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">수정일</span>
            <input type="datetime-local" class="form-control" id="board-update-date" name="boardUpdateDate" readonly value="<%=board.getBoardUpdateDate()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">추천수</span>
            <input type="number" class="form-control" id="board-like-count" name="boardLikeCount" readonly value="<%=board.getBoardLikeCount()%>">
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">내용</span>
            <textarea class="form-control" name="boardContent" id="board-content" rows="10" readonly><%=board.getBoardContent()%></textarea>
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-sm">
          <button type="button" class="btn btn-outline-secondary" id="btn-list">목록</button>
          <button type="button" class="btn btn-outline-info" id="btn-like">추천</button>
        </div>
        <div class="col-sm d-flex justify-content-end">
          <button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
          <button type="button" class="btn btn-warning ms-2" id="btn-edit">수정</button>
        </div>
      </div>
    </form>
  </section>
</main>

<%@ include file="./layout/Footer.jsp"%>

</body>
</html>











