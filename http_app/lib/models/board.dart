class Board {
  int? no;
  String? title;
  String? writer;
  String? content;
  DateTime? regDate;
  DateTime? updDate;

  Board({
    required this.no,
    required this.title,
    required this.writer,
    required this.content,
    this.regDate,
    this.updDate
  });
}