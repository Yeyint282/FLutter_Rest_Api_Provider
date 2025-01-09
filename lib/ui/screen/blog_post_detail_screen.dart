import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson/data/model/get_one_post_response.dart';
import 'package:flutter_provider_lesson/data/service/blog_api_service.dart';
import 'package:flutter_provider_lesson/provider/get_complete_post/get_complete_post_notifier.dart';
import 'package:flutter_provider_lesson/provider/get_complete_post/get_complete_post_state.dart';

import 'package:provider/provider.dart';

class Bl0gPostDetailScreen extends StatefulWidget {
  const Bl0gPostDetailScreen({super.key, required this.id});
  final int id;

  @override
  State<Bl0gPostDetailScreen> createState() => _Bl0gPostDetailScreenState();
}

class _Bl0gPostDetailScreenState extends State<Bl0gPostDetailScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getBlogDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<GetCompletePostNotifer>(
          builder: (_, getCompletePostNotifer, __) {
        GetCompletePostState getCompletePostState =
            getCompletePostNotifer.getCompletePostState;
        if (getCompletePostState is GetCompletePostSuccess) {
          GetOnePostResponse getOnePostResponse =
              getCompletePostState.getOnePostResponse;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(getOnePostResponse.body ?? ''),
                  Divider(),
                  if (getOnePostResponse.photo != null)
                    Image.network(
                        '${BlogApiService.baseUrl}${getOnePostResponse.photo}'),
                ],
              ),
            ),
          );
        } else if (getCompletePostState is GetCompletePostFailed) {
          return Column(
            children: [
              Text(getCompletePostState.errorMessage),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  _getBlogDetail(widget.id);
                },
                child: Text('Try Again'),
              ),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  void _getBlogDetail(int id) {
    Provider.of<GetCompletePostNotifer>(context, listen: false)
        .getCompletePost(id: widget.id);
  }
}
