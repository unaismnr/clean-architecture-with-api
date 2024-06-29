import 'package:clean_arch_project/features/domain/entities/post_entity.dart';

abstract class PostRepo {
  Future<List<PostEntity>> getAllPostFromDataSource();
}
