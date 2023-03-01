import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Downloads'),
        Icon(Icons.cast),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}
 