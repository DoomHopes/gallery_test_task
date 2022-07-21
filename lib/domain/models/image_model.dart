import 'package:gallery_test_task/domain/models/tad_model.dart';

import 'links_model.dart';
import 'urls_model.dart';
import 'user_model.dart';

class ImageModel {
  ImageModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.links,
    required this.urls,
    required this.user,
    required this.tags,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String description;
  String altDescription;
  Urls urls;
  User user;
  Links links;
  List<Tag> tags;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] ?? DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        links: Links.fromJson(json["links"]),
        urls: Urls.fromJson(json["urls"]),
        user: User.fromJson(json["user"]),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
      );
}
