import 'dart:convert';
import 'dart:developer';

import 'package:clean_arch_project/features/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDatasource {
  Future<List<PostModel>> getAllPostsFromApi();
}

class PostRemoteDatasourceImp extends PostRemoteDatasource {
  @override
  Future<List<PostModel>> getAllPostsFromApi() async {
    try {
      final res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (res.statusCode == 200) {
        final List<dynamic> parsed = jsonDecode(res.body);
        final posts = parsed.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      } else {
        log('Status Code is not 200');
      }
    } catch (e) {
      log(e.toString());
      Exception(e.toString());
    }
    return [];
  }
}
