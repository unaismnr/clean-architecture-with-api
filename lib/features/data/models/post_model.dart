import 'package:clean_arch_project/features/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required userId,
    required id,
    required title,
    required body,
  }) : super(
          title: title,
          body: body,
          id: id,
          userId: userId,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
