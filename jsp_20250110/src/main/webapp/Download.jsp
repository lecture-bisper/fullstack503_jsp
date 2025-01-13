<%@ page import="java.io.*" %>
<%@ page import="bitc.fullstack503.jsp_20250110.util.JSFunction" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 13.
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
//  이미지가 저장된 폴더 위치 지정
  String saveDir = "C:/uploads";
//  클라이언트에서 전달받은 저장된 파일명 가져오기
  String saveFileName = request.getParameter("sName");
//  클라이언트에서 전달받은 원본 파일명 가져오기
  String oriFileName = request.getParameter("oName");

  try {
//    저장된 파일명으로 파일 객체 생성
    File file = new File(saveDir, saveFileName);
//    InputStream 을 사용하여 파일 정보 가져오기
    InputStream inputStream = new FileInputStream(file);

//    한글 파일명 깨짐 방지
    String client = request.getHeader("User-Agent");
    if (client.indexOf("WOW64") == -1) {
//      다른 OS일 경우
      oriFileName = new String(oriFileName.getBytes("UTF-8"), "ISO-8859-1");
    }
    else {
//      윈도우일 경우
      oriFileName = new String(oriFileName.getBytes("KSC5601"), "ISO-8859-1");
    }

//    파일 다운로드용 응답 헤더 설정
    response.reset();
//    클라이언트로 전달할 방식 설정
    response.setContentType("application/octet-stream");
//    파일 이름 설정
    response.setHeader("Content-Disposition", "attachment; filename=\"" + oriFileName + "\"");
//    파일 크기 설정
    response.setHeader("Content-Length", "" + file.length());

//    출력 스트림 초기화
    out.clear();

//    response 내장 객체로부터 새로운 출력 스트립 생성
    OutputStream outputStream = response.getOutputStream();

//    파일의 크기만큼 버퍼 설정
    byte buff[] = new byte[(int)file.length()];
    int readBuffer = 0;
//    inputStream에서 파일 내용 읽어오기
    while ((readBuffer = inputStream.read(buff)) > 0) {
//      읽어온 파일 내용을 response 객체에 추가하기
      outputStream.write(buff, 0, readBuffer);
    }

//    입출력 스트림 닫기
    inputStream.close();
    outputStream.close();
  }
  catch (FileNotFoundException e) {
    JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
  }
  catch (Exception e) {
    JSFunction.alertBack("오류가 발생했습니다.", out);
  }
%>











