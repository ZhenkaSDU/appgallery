import 'dart:convert';

part 'GetPost.g.dart';

class GetPost {
  final int userId;
  final int id;
  final String title;
  final String body;

  GetPost({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  List<GetPost> welcomeFromJson(String str) => List<GetPost>.from(json.decode(str).map((x) => GetPost.fromJson(x)));

  String welcomeToJson(List<GetPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}