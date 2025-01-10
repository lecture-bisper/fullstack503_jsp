<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 25. 1. 10.
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 1. 클라이언트에서 전달한 데이터 가져오기 --%>
<%-- 2. DAO 를 사용하여 데이터베이스 연결 --%>
<%-- 3. DAO 에서 제공하는 메소드를 사용하여 조회수 증가 --%>
<%-- 4. 데이터베이스 연결 종료 --%>
<%-- 5. 데이터베이스 사용 결과에 따라 클라이언트에 데이터 전달 --%>

<%@ page import="bitc.fullstack503.jspmemberboard.database.JSPBoardDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.mysql.cj.xdevapi.JsonArray" %>

<%
  request.setCharacterEncoding("UTF-8");

  int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));

  JSPBoardDAO dao = new JSPBoardDAO();
  dao.dbOpen();
  dao.updateLikeCount(boardIdx);
  int result = dao.selectLikeCount(boardIdx);
  dao.dbClose();

  Map<String, String> resData = new HashMap<>();

  if (result > 0) {
    resData.put("result", "success");
    resData.put("data", String.valueOf(result));
  }
  else {
    resData.put("result", "error");
  }

//  Gson : Java에서 json 문자열을 파싱하고 생성하기 위해서 사용하는 라이브러리
//  json 문자열을 자바 클래스 타입의 객체로 변환하거나 자바 클래스 타입의 객체를 json 문자열로 변환할 수 있음
//  자바의 Map 타입 객체를 json 문자열로 변환할 수 있음

//  Gson 객체 생성
//  Gson gson = new Gson();

//  Json 객체 생성
//  JsonObject jobj = new JsonObject();
//  jobj.addProperty(key명,value값);
//  jobj.addProperty("name", "아이유");
//  jobj.addProperty("age", "34");

//  object -> json
//  Gson gson = new Gson();
//  String jsonStr = gson.toJson(java객체);

//  json -> object
//  Gson gson = new Gson();
//   java객체= gson.fromJson(json문자열, java객체.class);

//  Map -> json
//  Map<String, String> map = new HashMap<>();
//  map.put(key1, value1);
//  map.put(key2, value2);
//  Gson gson = new Gson();
//  String jsonStr = gson.toJson(map);

//  json -> Map
//  Gson gson = new Gson();
//  Map<String, String> map;
//  map = gson.fromJson(json문자열, Map.class);

//  Json을 사용하기 위한 Gson 클래스 타입의 객체 생성
  Gson gson = new Gson();
//  Gson에서 제공하는 toJson() 메소드를 사용하여 json문자열로 변환
  String resStr = gson.toJson(resData);

//  응답객체인 response의 데이터 전달 시 문자셋 설정
  response.setCharacterEncoding("UTF-8");
//  응답 객체에 전달하는 데이터의 타입을 설정, json 방식으로 전달
  response.setContentType("application/json");
//  응답 객체인 response에 만들어놓은 json 문자열을 추가하여 클라이언트로 전달
  response.getWriter().write(resStr);

//  클라이언트로 단순 문자열 전송 시
//  response.setContentType("text/plain");
//  response.setCharacterEncoding("UTF-8");
//  response.getWriter().write(String.valueOf(result));
%>











