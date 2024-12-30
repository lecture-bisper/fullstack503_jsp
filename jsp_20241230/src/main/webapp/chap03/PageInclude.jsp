<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 30.
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 사용자가 생성한 Person 클래스를 현재 jsp 파일에 import --%>
<%@ page import="bitc.fullstack503.jsp_20241230.Person" %>

<h3>Include 페이지</h3>
<%
//  현재 페이지인 PageInclude.jsp 에서는 pageContext 내장 객체에 데이터를 저장한 적이 없음

//  PageContextMain.jsp 파일에서 PageInclude.jsp 파일을 include하여 포함하였으므로 PageContextMain.jsp 에서 pageContext 내장 객체에 저장한 데이터를 함께 사용할 수 있음

//  pageContext 내장 객체에 저장된 pageInteger 의 데이터를 가져옴
  int pInteger2 = (Integer)(pageContext.getAttribute("pageInteger"));
//  pageContext 내장 객체에 저장된 pageString 의 데이터를 가져옴
  String pString2 = pageContext.getAttribute("pageString").toString();
//  pageContext 내장 객체에 저장된 pagePerson 의 데이터를 가져옴
  Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>

<ul>
<%--  표현식으로 데이터를 출력 --%>
  <li>Integer 객체 : <%=pInteger2%></li>
  <li>String 객체 : <%=pageContext.getAttribute("pageString")%></li>
  <li>Person 객체 : <%=pPerson2.getName()%>, <%=pPerson2.getAge()%></li>
</ul>











