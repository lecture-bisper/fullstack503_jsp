<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 10.
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. 필요한 클래스 import --%>
<%-- 3. 선언부를 통해서 파일 저장 메소드 선언 --%>
<%-- 4. 파일 저장 메소드에서 DAO 를 이용하여 데이터베이스 연결 --%>
<%-- 5. 클라이언트에서 전달받은 데이터를 기반으로 DTO 객체 생성 --%>
<%-- 6. DAO 에서 제공하는 메소드를 사용하여 데이터베이스에 파일 정보 추가 --%>
<%-- 7. 데이터베이스 연결 종료 --%>
<%-- 8. FileList.jsp로 리다이렉트 --%>

<%@ page import="bitc.fullstack503.jsp_20250110.database.JSPBoardFileDTO" %>
<%@ page import="bitc.fullstack503.jsp_20250110.database.JSPBoardFileDAO" %>
<%@ page import="bitc.fullstack503.jsp_20250110.filepuload.FileUtil" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="org.apache.commons.fileupload2.core.DiskFileItem" %>
<%@ page import="java.io.IOException" %>

<%!
//  실제 파일을 서버에 저장하고, 파일 정보를 데이터베이스에 저장하는 메소드
private void insertUploadFile(Map<String, Object> uploadData, String saveDir) throws IOException {

//  form 태그 중 name 값이 title인 태그의 값을 저장할 변수
  String title = "";
//  form 태그 중 name 값이 cate(checkbox)인 태그의 값을 저장할 변수(
  StringBuffer cateBuff = new StringBuffer();

//  매개변수로 받아온 Map 타입의 객체에서 key만 모두 출력
  Set<String> keys = uploadData.keySet();

//  파일의 원본 이름
  String oriFileName = "";
//  서버에 저장할 변경된 파일 이름
  String saveFileName = "";

//  key 를 기반으로 Map 타입의 객체에서 데이터를 출력
  for (String key : keys) {
    switch (key) {
      case "title":
//        title 값을 가져옴
        title = (String)uploadData.get(key);
        break;

      case "cate":
//        checkbox 의 값을 모두 가져옴
        List<String> cateList = (List<String>)uploadData.get(key);
//        반복문을 사용하여 List에 들어있는 데이터를 출력
        for (String cate : cateList) {
          cateBuff.append(cate);
        }
        break;

      case "ofile":
//        업로드된 파일일 경우
        DiskFileItem item = (DiskFileItem) uploadData.get(key);
//        업로드된 DiskFileItem 타입의 객체를 서버의 지정된 디스크에 저장하고 원본 파일명을 가져옴
        oriFileName = FileUtil.uploadFile(item, saveDir);
//        가져온 원본 파일명을 새로운 파일명으로 수정하고, 새 파일명을 가져옴
        saveFileName = FileUtil.renameFile(saveDir, oriFileName);
        break;
    }
  }

//  데이터베이스에 저장하기 위한 DTO 객체 생성 및 데이터 저장
    JSPBoardFileDTO file = new JSPBoardFileDTO();
    file.setTitle(title);
    file.setCate(cateBuff.toString());
    file.setOfile(oriFileName);
    file.setSfile(saveFileName);

//    DAO를 사용하여 데이터베이스 연결
    JSPBoardFileDAO dao = new JSPBoardFileDAO();
    dao.dbOpen();
//    DAO에서 제공하는 insertFile로 데이터베이스에 저장
    dao.insertFile(file);
    dao.dbClose();
}
%>

<%
//  클라이언트에서 서버로 전달한 파일을 저장할 폴더 설정
  String saveDir = "C:/uploads";

//  아파치 파일 업로드 라이브러리를 사용하여 클라이언트에서 전달한 데이터를 가져오기
  Map<String, Object> uploadData = FileUtil.parseUpload(request);

//  실제 데이터베이스에 파일 정보 등록, 업로드된 파일 정보를 실제 서버의 디스크에 저장
  insertUploadFile(uploadData, saveDir);

//  지정한 페이지로 이동
  response.sendRedirect("./FileList.jsp");
%>











