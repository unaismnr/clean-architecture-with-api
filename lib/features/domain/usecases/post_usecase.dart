import 'package:clean_arch_project/features/data/repositories/post_repo_impl.dart';
import 'package:clean_arch_project/features/domain/entities/post_entity.dart';

class PostUsecase {
  Future<List<PostEntity>> getAllPostFromDataSource() {
    final postRepo = PostRepoImpl();
    return postRepo.getAllPostFromDataSource();
  }
}
