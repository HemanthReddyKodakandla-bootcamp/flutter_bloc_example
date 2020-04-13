import 'dart:convert';

List<ImagesAlbum> imagesAlbumFromJson(String str) => List<ImagesAlbum>.from(json.decode(str).map((x) => ImagesAlbum.fromJson(x)));

String imagesAlbumToJson(List<ImagesAlbum> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImagesAlbum {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  ImagesAlbum({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory ImagesAlbum.fromJson(Map<String, dynamic> json) => ImagesAlbum(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}