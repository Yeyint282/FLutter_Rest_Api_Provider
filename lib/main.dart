import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson/provider/get_all_post/get_all_provider.dart';
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
    return ChangeNotifierProvider(
      create: (_) => GetAllPostNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
