class Tag {
  Tag({
    required this.type,
    required this.title,
  });

  String? type;
  String? title;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        type: json["type"],
        title: json["title"],
      );
}
