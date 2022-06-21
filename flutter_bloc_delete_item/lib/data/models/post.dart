import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;

  const Post({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];

  @override
  bool? get stringify => true;

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(id: json['id'], title: json['title']);
}
