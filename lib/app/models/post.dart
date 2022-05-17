import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nylo_support/helpers/helper.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable{

  String? id;
  String? title;
  String? createdAt;

  Post({this.id, this.title, this.createdAt});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json['id'],
        title: json['title'],
        createdAt: json['createdAt'],
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'createdAt': createdAt,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id , title , createdAt];
}
