package bitc.fullstack503.jsp_20250107; // 기본 패키지 이외의 패키지 (규약 1번)

public class Person {

//  필드에 private 접근제한자 사용 (규약 2번)
  private String name;
  private int age;

//  기본 생성자가 반드시 필요 (규약 4번)
  public Person() {}

  public Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

//  getter/setter 가 반드시 필요 (규약 3번)
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }
}












