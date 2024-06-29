import 'package:clean_arch_project/features/data/datasources/post_remote_datasource.dart';
import 'package:clean_arch_project/features/domain/entities/post_entity.dart';
import 'package:clean_arch_project/features/domain/repositories/post_repo.dart';

class PostRepoImpl extends PostRepo {
  final postData = PostRemoteDatasourceImp();
  @override
  Future<List<PostEntity>> getAllPostFromDataSource() async {
    final posts = await postData.getAllPostsFromApi();
    return posts;
  }
}
