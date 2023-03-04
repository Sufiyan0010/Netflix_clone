import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class Videowidget extends StatelessWidget {
  const Videowidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            newHotTempImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_up,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
