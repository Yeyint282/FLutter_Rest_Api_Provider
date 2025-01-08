import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson/data/model/get_all_post_response.dart';
import 'package:flutter_provider_lesson/provider/get_all_post_state.dart';
import 'package:flutter_provider_lesson/provider/get_all_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getAllPost(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        centerTitle: true,
        title: const Text('Flutter Provider Lesson'),
        leading: const Icon(Icons.info),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Consumer<GetAllPostNotifier>(
        builder: (_, getAllProvider, __) {
          GetAllPostState getAllPostState = getAllProvider.getAllPostState;
          if (getAllPostState is GetAllPostSuccess) {
            List<GetAllPostResponse> getAllPostResponseList =
                getAllPostState.getAllPostList;
            return ListView.builder(
              itemCount: getAllPostResponseList.length,
              itemBuilder: (context, index) {
                GetAllPostResponse getAllPostResponse =
                    getAllPostResponseList[index];
                return Card(
                  child: ListTile(
                    title: Text('${getAllPostResponse.title}'),
                  ),
                );
              },
            );
          } else if (getAllPostState is GetAllPostFail) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Something went wrong'),
                Divider(),
                ElevatedButton(
                  onPressed: () {
                    _getAllPost(context);
                  },
                  child: Text('Try Again'),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void _getAllPost(BuildContext ctx) {
    Provider.of<GetAllPostNotifier>(ctx, listen: false).getAllPost();
  }
}
