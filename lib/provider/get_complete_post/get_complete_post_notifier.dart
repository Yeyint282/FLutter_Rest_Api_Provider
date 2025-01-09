import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson/data/model/get_one_post_response.dart';
import 'package:flutter_provider_lesson/data/service/blog_api_service.dart';
import 'package:flutter_provider_lesson/provider/get_complete_post/get_complete_post_state.dart';

class GetCompletePostNotifer extends ChangeNotifier {
  GetCompletePostState getCompletePostState = GetCompletePostLoading();
  final BlogApiService _blogApiService = BlogApiService();
  void getCompletePost({required int id}) async {
    getCompletePostState = GetCompletePostLoading();
    notifyListeners();
    try {
      GetOnePostResponse getOnePostResponse =
          await _blogApiService.getOnePost(id);
      getCompletePostState = GetCompletePostSuccess(getOnePostResponse);
      notifyListeners();
    } catch (e) {
      getCompletePostState = GetCompletePostFailed('Something wrong');
    }
  }
}
