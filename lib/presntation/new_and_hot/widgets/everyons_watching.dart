import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button.dart';
import 'video_widget.dart';

class EveryonsWatchingwidget extends StatelessWidget {
  const EveryonsWatchingwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khieght,
        const Text(
          'Friends',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        khieght,
        const Text(
          'This hit sitcom follows the merry misadventures of six 20-something pals as they navigation the pitfals of work,life love in 1990s manhattan',
          style: TextStyle(
            color: greyColor,
          ),
        ),
        khieght,
        const Videowidget(),
        khieght,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 12,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 12,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 12,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
