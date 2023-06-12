import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class News{
  String title;
  String description;
  String img;

  News(this.title, this.description, this.img)
}