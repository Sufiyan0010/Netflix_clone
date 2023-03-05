import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button.dart';
import 'video_widget.dart';

class EveryonsWatchingwidget extends StatelessWidget {
  final String backdropPath;
  final String description;
  final String movieName;

  const EveryonsWatchingwidget({
    super.key,
    required this.backdropPath,
    required this.description,
    required this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khieght,
        Text(
          movieName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        khieght,
        Text(
          description,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: greyColor,
            
          ),
        ),
        khieght,
        Videowidget(
          url: backdropPath,
        ),
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
