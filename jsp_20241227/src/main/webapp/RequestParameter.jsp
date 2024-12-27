<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 12. 27.
  Time: ���� 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="euc-kr" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>���� ��ü - request</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%
  // Ŭ���̾�Ʈ���� ���޵Ǵ� �����ʹ� ��� ���ڿ�
//  ���޵� ���ڿ��� ���ڼ��� �ٸ� �� ����
//  ���޵Ǵ� ���ڿ��� ���ڼ��� �����ֱ� ���� ��ɾ�
  request.setCharacterEncoding("UTF-8");

//  getParameter() : Ŭ���̾�Ʈ���� ����ڰ� form �±׸� ���� ������ �����͸� �������� �޼ҵ�
//  �Ű������� �Է��� 1���� �����͸� ������
//  Ŭ���̾�Ʈ�� input �±� name �Ӽ����� �Ű������� ���� �����ؾ� ��
//  ���޹��� �����ʹ� ��� ���ڿ�, �ʿ信 ���� ������ Ÿ�� ��ȯ�� �ʿ���
  String id = request.getParameter("id");
  String gender = request.getParameter("gender");
//  getParameterValues() : getParameter() �� ������ ����� ���� �޼ҵ�
//  �Ű������� �Է��� �����͸� �迭�� ������
//  �ַ� checkbox �� �����͸� �������µ� �����
  String[] favo = request.getParameterValues("favo");
  String favoStr = "";

  if (favo != null) {
    for (int i = 0; i < favo.length; i++) {
      favoStr += favo[i] + " ";
    }
  }

//  replace() : String Ŭ�������� �����ϴ� ���ڿ� ���� �޼ҵ�
//  ù��° �Ű������� ���ڿ��� �˻��Ͽ� �ι�° �Ű������� ���ڿ��� ����

//  textarea �±׸� ���ؼ� ������ ���޵� �����͵� ���ڿ� ������ 1����
//  textarea �±״� ���� ������ �����͸� �Է��ؼ� ����ϱ� ������ ����ڰ� ���� ȭ�鿡���� �ٹٲ� ��ȣ�� ������ ������ �����δ� ������
//  Ŭ���̾�Ʈ���� ���޹��� �����͸� html �� ��� �� html�� \nȤ�� \r ���� �̽������� ���ڸ� �ؼ��� �� ���� ������ �ϳ��� �������� ��µ�
//  ����ڰ� �Է��� ��� �״�� html �� ����ϰ��� �� ��� \r\n �� html�� �ٹٲ� �±��� <br>�� �ٲ� ��
  String intro = request.getParameter("intro").replace("\r\n", "<br>");
%>

<div class="container mt-5">
  <ul class="list-group">
<%--    ǥ������ ����Ͽ� ��ũ��Ʋ������ ������ ������ html ȭ������ ��� --%>
    <li class="list-group-item">���̵� : <%=id%></li>
    <li class="list-group-item">���� : <%=gender%></li>
    <li class="list-group-item">���ɻ��� : <%=favoStr%></li>
    <li class="list-group-item">�ڱ�Ұ� : <%=intro%></li>
  </ul>
</div>
</body>
</html>











