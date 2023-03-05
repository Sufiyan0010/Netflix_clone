import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MainCardWidgets extends StatelessWidget {
  final String imageUrl;
  const MainCardWidgets({
    super.key,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: kRadius10,
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
