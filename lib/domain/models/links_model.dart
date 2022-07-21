class Links {
  String? self;
  String? html;
  String? download;

  Links({required this.self, required this.download, required this.html});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        html: json["html"],
        download: json["download"],
      );
}