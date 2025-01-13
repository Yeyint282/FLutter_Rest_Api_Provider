import 'package:flutter_provider_lesson/data/model/blog_upload_response.dart';

abstract class UploadUiState {}

class UploadUiLoading extends UploadUiState {
  final int progress;
  UploadUiLoading(this.progress);
}

class UploadUiSucces extends UploadUiState {
  final BlogUploadResponse blogUploadResponse;
  UploadUiSucces(this.blogUploadResponse);
}

class UbploadUiFialed extends UploadUiState {
  final String errorMessage;

  UbploadUiFialed(this.errorMessage);
}
