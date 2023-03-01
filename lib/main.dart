import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

import 'presntation/main_page/screen_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:backgroundColor,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            background: Colors.black,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
            ),
          )),
      home:  ScreenMain(),
    );
  }
}
