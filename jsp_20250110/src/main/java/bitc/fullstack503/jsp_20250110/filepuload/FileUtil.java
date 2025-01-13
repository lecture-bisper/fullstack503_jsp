package bitc.fullstack503.jsp_20250110.filepuload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletFileUpload;
import org.apache.commons.fileupload2.core.FileItem;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

public class FileUtil {

//  클라이언트에서 전달받은 파일 정보를 서버의 디스크에 실제로 저장하는 메소드
  public static String uploadFile(DiskFileItem item, String sDir) throws IOException {
//    파일 이름을 저장할 변수
    String fileName = "";

//    자바에서 제공하는 File 클래스를 사용하여 파일 객체를 생성 및 파일명 가져오기
    fileName = new File(item.getName()).getName();
//    서버에 저장할 위치 설정 (전체 파일명으로 설정)
//    File.separator : 사용하는 OS에 맞도록 "/" 를 추가함
    String filePath = sDir + File.separator + fileName;

//    생성된 전체 파일명을 기준으로 File 객체 생성
    File saveFile = new File(filePath);

//    실제 서버의 디스크에 파일을 저장하는 로직
    try (
//        전달받은 DiskFileItem 객체에서 InputStream() 객체를 가져옴
        InputStream inputStream = item.getInputStream();
//        자바에서 제공하는 FileOutputStream 객체를 통해서 실제 파일을 생성
        FileOutputStream outputStream = new FileOutputStream(saveFile)) {
//      파일을 저장하기 위한 버퍼 생성
      byte[] buffer = new byte[1024];
//      스트림에서 읽어온 파일 내용의 크기
      int bytesRead;
//      inputStream.read(buffer) 을 통해서 지정한 버퍼의 크기만큼 파일 정보를 가져옴
//      가져온 파일의 크기가 -1 (-1은 더이상 읽어올 데이터가 없음) 일 경우 읽기 중지
      while ((bytesRead = inputStream.read(buffer)) != -1) {
//        FileOutputStream의 write() 메소드를 사용하여 읽어온 파일 정보를 실제 파일에 쓰기
        outputStream.write(buffer, 0, bytesRead);
      }
    }
//    생성된 파일 이름을 반환
    return fileName;
  }

//  클라이언트에서 전달받은 데이터 중에서 폼 데이터와 파일 데이터로 구분하는 메소드
//  매개변수로 request 내장 객체를 받음
  public static Map<String, Object> parseUpload(HttpServletRequest req) {
//     폼 데이터와 파일 데이터를 구분해서 저장할 Map 타입 객체
    Map<String, Object> uploadData = new HashMap<>();
//    checkbox로 전달된 데이터를 저장하기 위한 List
    List<String> cateList = new ArrayList<>();

    try {
//      아파치 파일업로드 라이브러리에서 제공
//      업로드된 정보를 저장하기 위한 세팅
      DiskFileItemFactory factory = DiskFileItemFactory.builder()
//          기본 버퍼 크기 설정, byte크기로 설정 (
          .setBufferSize(1024 * 1024)
//          업로드된 데이터의 임시 저장 장소 설정 (사용자가 지정한 폴더, 시스템 폴더 사용)
          .setPath(Paths.get(System.getProperty("java.io.tmpdir")))
          .get();

//      업로드 되는 파일의 크기 설정
      JakartaServletFileUpload<DiskFileItem, DiskFileItemFactory> upload = new JakartaServletFileUpload<>(factory);
//      업로드 되는 파일 하나의 최대 크기 설정
      upload.setFileSizeMax(10 * 1024 * 1024);
//      업로드 되는 총 파일의 최대 크기 설정
      upload.setSizeMax(50 * 1024 * 1024);

//      클라이언트에서 전달받은 폼 데이터 및 파일 데이터를 가져옴
//      upload.parseRequest(req) : request 내장객체에서 아파치 파일 업로드 라이브러리로 설정한 방식대로 데이터를 읽어 옴
//      클라이언트의 form 태그에서 입력한 내용의 수 만큼 데이터를 가져옴
      List<DiskFileItem> formItems = upload.parseRequest(req);
//      가져온 데이터만큼 반복 실행
      for (DiskFileItem item : formItems) {

//        현재 DiskFileItem 객체가 폼의 input 태그 중 file 을 의미하는지 아닌지를 확인
        if(!item.isFormField()) {
//          파일일 경우
          String fieldName = item.getFieldName();
//          Map 타입의 객체에 key값을 'ofile', value값을 DiskFileItem 타입으로 저장
          uploadData.put(fieldName, item);
        }
        else {
//          일반 input 태그일 경우
//          getFieldName() : 클라이언트에서 전달된 데이터의 name속성 이름 가져오기
          switch (item.getFieldName()) {
            case "title":
//              getString() : 지정한 name 속성명을 가지고 있는 태그의 값을 가져옴
//              getString()으로 데이터를 가져올 경우 기본적으로 문자셋이 ISO-8895-1 방식으로 가져옴
//              한글이 깨지지 않도록 문자셋을 설정함
              uploadData.put("title", item.getString(StandardCharsets.UTF_8));
              break;

            case "cate":
//              checkbox의 데이터를 가져왔을 경우
//              카테고리 정보를 List타입의 객체에 추가함
              cateList.add(item.getString(StandardCharsets.UTF_8));
              break;
          }
        }
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    }

//    카테고리 정보를 저장한 List가 비었는지 확인
    if (!cateList.isEmpty()) {
//      내용이 있을 경우 Map 타입 객체에 추가 함
      uploadData.put("cate", cateList);
    }

//    완성된 업로드 데이터를 반환
    return uploadData;
  }

//  클라이언트에서 전달받은 파일이 저장된 폴더 위치와 원본 파일명을 매개변수로 받음
//  원본 파일명을 새로운 파일명으로 수정
  public static String renameFile(String sDir, String fileName) {
//    확장자 가져오기
    String ext = fileName.substring(fileName.lastIndexOf("."));
//    현재 시간을 기준으로 4자리 년도, 2자리 월, 2자리 일, 24시간, 2자리 분, 2자리 초 형식의 문자열을 생성
    String now = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
//    생성된 시간과 확장자를 합하여 새로운 파일명으로 생성
    String newFileName = now + ext;

//    원본 파일명으로 파일 객체 생성
    File oldFile = new File(sDir + File.separator + fileName);
//    새 파일명으로 파일 객체 생성
    File newFile = new File(sDir + File.separator + newFileName);
//    원본 파일명의 파일을 새 파일명으로 변경
    oldFile.renameTo(newFile);

//    새 파일명 반환
    return newFileName;
  }
}












