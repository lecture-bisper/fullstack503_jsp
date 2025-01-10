<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 8.
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDTO" %>
<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDAO" %>

<%@ page import="java.util.List" %>

<%
//  페이징 기능을 추가한 목록 페이지

//  페이징 기능 사용 시 필요한 정보
//  현재 페이지 번호, 한 페이지당 출력할 게시물 수, 한 화면에 표시할 블록의 수, 게시물의 전체 수, 전체 페이지 수, 현재 블록번호, 현재 블록의 시작 번호, 현재 블록의 마지막 번호

//  클라이언트에서 pageNum 이라는 이름으로 데이터 가져오기
  String tempPage = request.getParameter("pageNum");

  int currentPage = 1; // 현재 페이지 번호, 기본값 1
  int itemPerPage = 3; // 한 페이지당 출력할 게시물 수
  int blockSize = 5; // 한 화면에 표시할 블록의 수

//  클라이언트에서 전달받은 데이터 중 pageNum 이라는 이름의 데이터가 있을 경우 현재 페이지 번호를 저장한 변수 currentPage 에 전달받은 pageNum의 값을 저장
  if (tempPage != null) {
    currentPage = Integer.parseInt(tempPage);
  }

//  데이터베이스에서 가져올 게시물의 시작 번호
//  Limit  OFFSET 에서 사용할 offset 값을 계산
  int offset = (currentPage - 1) * itemPerPage;

  int totalItems = 0; // 전체 게시물 수
  int totalPages = 0; // 전체 페이지 수
  int currentBlock = (currentPage - 1) / blockSize + 1; // 현재 블록
  int startPage = (currentBlock - 1) * blockSize + 1; // 현재 블록의 시작 페이지
  int endPage = startPage + blockSize - 1; // 현재 블록의 마지막 페이지

//  게시물 목록을 저장하기 위한 List 타입의 변수 선언
  List<JSPBoardDTO> boardList = null;

//  데이터베이스 연결
  JSPBoardDAO dao = new JSPBoardDAO();
  dao.dbOpen();

//  DAO에서 제공하는 메소드를 사용하여 게시물의 전체 수를 가져옴
  totalItems = dao.selectBoardTotalCount();

//  Math.ceil() : 자바의 수학관련 클래스에서 제공하는 소수점자리 올림 기능 메소드
//  ceil() 사용 시 소수점 자리의 숫자가 없을 경우(int타입일 경우) 올림 기능이 동작하지 않음
//  나눗셈의 결과가 소수점자리까지 표현할 수 있도록 double 타입으로 변환 후 연산
//  전체 페이지 수 계산
  totalPages = (int)Math.ceil((double)totalItems / itemPerPage);

//  현재 블록의 마지막 페이지 번호가 전체 페이지 번호보다 클 경우 전체 페이지 번호를 마지막 페이지 번호로 설정
  if (endPage > totalPages) {
    endPage = totalPages;
  }

//  dao에서 제공하는 selectBoardList(게시물 수, 게시물 index) 를 사용하여 게시물 정보를 지정한 만큼 가져옴
//  가져온 데이터를 JSPBoardDTO 타입으로 생성한 List에 저장함
  boardList = dao.selectBoardList(itemPerPage, offset);

//  데이터베이스 연결 종료
  dao.dbClose();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원제 게시판 목록 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%-- 미리 생성한 Header 파일을 include --%>
<%-- 디렉티브 태그의 include를 사용해야 함 --%>
<%@ include file="./layout/Header.jsp" %>

<%-- 미리 생성한 네비게이션바 파일을 include --%>
<%-- 액션태그의 include나 디렉티브 태그의 include 중 아무꺼나 사용 --%>
<%--<%@ include file="./layout/Menu.jsp" %>--%>
<jsp:include page="./layout/Menu.jsp"></jsp:include>

<main class="container mt-5">
  <section>
    <div class="row my-3">
      <div class="col-sm">
        <table class="table table-hover table-striped text-center">
          <colgroup>
            <col style="width: 10%;">
            <col style="width: 55%;">
            <col style="width: 10%;">
            <col style="width: 15%;">
            <col style="width: 5%;">
            <col style="width: 5%;">
          </colgroup>
          <thead>
          <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>추천수</th>
          </tr>
          </thead>
          <tbody>
          <%
//            가져온 게시물 정보를 for 문을 사용하여 화면에 출력
            for (JSPBoardDTO board : boardList) {
          %>
          <tr>
            <td><%=board.getBoardIdx()%></td>
            <td class="text-start">
<%--              화면 이동이 필요한 부분에 a 태그와 게시물 번호를 사용 --%>
              <a href="./View.jsp?boardIdx=<%=board.getBoardIdx()%>" class="text-decoration-none"><%=board.getBoardTitle()%></a>
            </td>
            <td><%=board.getBoardCreateId()%></td>
            <td><%=board.getBoardCreateDate()%></td>
            <td><%=board.getBoardViewCount()%></td>
            <td><%=board.getBoardLikeCount()%></td>
          </tr>
          <%
            }
          %>
          </tbody>
        </table>
      </div>
    </div>

    <div class="row mt-3">
      <div class="col-sm">
        <ul class="pagination justify-content-center">
<%--          이전페이지 --%>
<%--          이전페이지는 현재 블록 이전으로 이동할 수 없으므로 disabled 처리 --%>
          <li class="page-item <%=(currentBlock == 1) ? "disabled" : ""%>">
<%--            a 태그를 사용하여 이동할 페이지 번호를 설정 --%>
<%--            현재 블록의 시작 페이지 번호 - 1을 하여 이전 블록의 마지막 페이지로 이동 --%>
            <a href="ListPaging.jsp?pageNum=<%=startPage - 1%>" class="page-link">&laquo;</a>
          </li>
<%--          현재 블록의 페이지 목록, 반복문으로 출력 --%>
<%--          반복문을 사용하여 현재 블록의 시작 페이지와 마지막 페이지까지의 페이지 번호를 출력 --%>
          <%
            for (int i = startPage; i <= endPage; i++) {
          %>
<%--          반복문의 현재 순번과 현재 페이지 번호가 같을 경우 active 처리 --%>
          <li class="page-item <%=(i == currentPage) ? "active" : ""%>">
<%--            a 태그를 사용하여 이동할 페이지 번호를 설정 --%>
            <a href="ListPaging.jsp?pageNum=<%=i%>" class="page-link"><%=i%></a>
          </li>
          <%
            }
          %>
<%--          다음페이지 --%>
<%--          다음페이지 번호가 전체페이지 번호와 같을 경우 더이상 이동할 페이지가 없으므로 disabled --%>
          <li class="page-item <%=(endPage == totalPages) ? "disabled" : ""%>">
<%--            a 태그를 사용하여 이동할 페이지 번호를 설정 --%>
<%--            현재 블록의 마지막 페이지 번호 + 1을 하여 다음 블록의 시작 페이지로 이동 --%>
            <a href="ListPaging.jsp?pageNum=<%=endPage + 1%>" class="page-link">&raquo;</a>
          </li>
        </ul>
      </div>
    </div>

    <div class="row mt-3">
      <div class="col-sm">
        <div class="d-flex justify-content-end">
          <a href="./Write.jsp" class="btn btn-primary">글쓰기</a>
        </div>
      </div>
    </div>
  </section>
</main>

<%-- 미리 생성한 Footer 파일을 include --%>
<%@ include file="./layout/Footer.jsp"%>

</body>
</html>











