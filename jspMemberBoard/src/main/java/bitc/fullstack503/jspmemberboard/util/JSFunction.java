package bitc.fullstack503.jspmemberboard.util;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {

  public static void alertLocation(String msg, String url, JspWriter out) {
    try {
      String script = "<script>";
      script += "alert('" + msg + "');";
      script += "location='" + url + "';";
      script += "</script>";

      out.println(script);
    }
    catch (Exception e) {}
  }

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












