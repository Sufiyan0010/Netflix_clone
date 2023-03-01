import 'package:flutter/material.dart';


import 'presntation/main_page/widgets/screen_main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Demo',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home:const ScreenMain() , 
    );
  }
}