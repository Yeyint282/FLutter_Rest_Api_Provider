import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson/data/model/blog_upload_response.dart';
import 'package:flutter_provider_lesson/data/service/blog_api_service.dart';
import 'package:flutter_provider_lesson/provider/upload_post/upload_ui_state.dart';

class BlogUploadNotifier extends ChangeNotifier {
  UploadUiState uploadUiState = UploadUiLoading(0);
  final BlogApiService _blogApiService = BlogApiService();
  void upLoad({
    required String title,
    required String body,
    required FormData data,
  }) async {
    try {
      uploadUiState = UploadUiLoading(0);
      BlogUploadResponse uploadResponse = await _blogApiService.uploadPost(
          title: title,
          body: body,
          data: data,
          onSendProgress: (int sent, int size) {
            int progress = ((sent / size) * 100).toInt();
            uploadUiState = UploadUiLoading(progress);
          });
      uploadUiState = UploadUiSucces(uploadResponse);
    } catch (e) {
      uploadUiState = UbploadUiFialed('Something wrong');
    }
  }
}
