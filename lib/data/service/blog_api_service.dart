import 'package:dio/dio.dart';
import 'package:flutter_provider_lesson/data/model/get_all_post_response.dart';
import 'package:flutter_provider_lesson/data/model/get_one_post_response.dart';

class BlogApiService {
  static const String baseUrl = 'http://rubylearner.com:500/';
  late Dio dio;
  BlogApiService() {
    dio = Dio();
  }

  Future<List<GetAllPostResponse>> getAllPosts() async {
    final postListResponse = await dio.get('${baseUrl}posts');
    final postList = (postListResponse.data as List).map((e) {
      return GetAllPostResponse.fromJson(e);
    }).toList();
    return postList;
  }

  Future<GetOnePostResponse> getOnePost(int id) async {
    final postResponse = await dio.get('${baseUrl}post?id=$id');
    final postList = (postResponse.data as List);
    final post = GetOnePostResponse.fromJson(postList[0]);
    return post;
  }
}
