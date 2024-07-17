class Student {
  // 이미지 경로
  // 학생 이름
  // 나이
  // 졸업 여부
  String? imagePath;
  String? name;
  int? age;
  bool? isGraduated;

  // 생성자
  Student(
    // requried : 객체 생성 시, 필수로 전달해야할 값으로 지정
    {
      required this.imagePath,
      required this.name,
      this.age,
      this.isGraduated
    }
  );

}