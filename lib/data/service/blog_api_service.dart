import 'package:dio/dio.dart';
import 'package:flutter_provider_lesson/data/model/blog_upload_response.dart';
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

  Future<BlogUploadResponse> uploadPost(
      {required String title,
      required String body,
      required FormData data,
      required Function(int, int) onSendProgress}) async {
    final uploadResponse = await dio.post(
        '${baseUrl}post?title=$title&body=$body',
        data: data,
        onSendProgress: onSendProgress);
    return BlogUploadResponse.fromJson(uploadResponse.data);
  }
}
