import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MainCardWidgets extends StatelessWidget {
  const MainCardWidgets({
    super.key,
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
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.themoviedb.org/t/p/w220_and_h330_face/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
