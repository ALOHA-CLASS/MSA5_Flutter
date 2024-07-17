class User {
  String? id;
  String? name;
  int? age;
  String? gender;

  // 생성자
  User({
    required this.id,
    required this.name,
    this.age,
    this.gender
  });
}