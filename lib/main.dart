import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson/provider/get_all_post/get_all_provider.dart';
import 'package:flutter_provider_lesson/provider/get_complete_post/get_complete_post_notifier.dart';
import 'package:flutter_provider_lesson/ui/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetAllPostNotifier()),
        ChangeNotifierProvider(create: (_) => GetCompletePostNotifer()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
