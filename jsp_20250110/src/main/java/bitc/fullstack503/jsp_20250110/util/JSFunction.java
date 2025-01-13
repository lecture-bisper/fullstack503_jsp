package bitc.fullstack503.jsp_20250110.util;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {

//  자바스크립트의 location.href 를 사용하기 위한 메소드
//  첫번째 매개변수로 알림창의 메시지를 받음
//  두번째 매개변수로 이동할 페이지의 주소를 받음
//  세번째 매개변수로 JSP 페이지의 화면에 내용을 출력하기 위한 JspWriter 클래스 타입의 객체를 받음
//  JSP의 out 내장 객체가 JspWriter 임
//  static을 사용하여 정적 메소드로 선언하여 객체 생성없이 클래스명을 통해서 바로 사용
  public static void alertLocation(String msg, String url, JspWriter out) {
    try {
//      html에서 자바스크립트로 동작하기 위한 소스코드를 java 문자열로 생성함
      String script = "<script>";
      script += "alert('" + msg + "');";
      script += "location.href='" + url + "';";
      script += "</script>";

      out.println(script);
    }
    catch (Exception e) {}
  }

//  자바스크립트의 history.back() 을 사용하기 위한 메소드
  public static void alertBack(String msg, JspWriter out) {
    try {
      String script = "<script>";
      script += "alert('" + msg + "');";
      script += "history.back();";
      script += "</script>";

      out.println(script);
    }
    catch (Exception e) {}
  }
}












