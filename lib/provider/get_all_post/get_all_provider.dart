import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson/data/model/get_all_post_response.dart';
import 'package:flutter_provider_lesson/data/service/blog_api_service.dart';
import 'package:flutter_provider_lesson/provider/get_all_post/get_all_post_state.dart';

class GetAllPostNotifier extends ChangeNotifier {
  GetAllPostState getAllPostState = GetAllPostLoading();
  final BlogApiService blogApiService = BlogApiService();
  Future<void> getAllPost() async {
    getAllPostState = GetAllPostLoading();
    notifyListeners();
    try {
      List<GetAllPostResponse> getAllPostList =
          await blogApiService.getAllPosts();
      getAllPostState = GetAllPostSuccess(getAllPostList);
      notifyListeners();
    } catch (e) {
      getAllPostState = GetAllPostFail(e.toString());
    }
  }
}
