import 'package:equatable/equatable.dart';

class Post extends Equatable{
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  const Post({required this.id, this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id : json['id'] as int,
      userId : json['userId'] as int?,
      title : json['title'] as String?,
      body : json['body'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  @override
  List<Object?> get props => [id, userId, title, body];
}