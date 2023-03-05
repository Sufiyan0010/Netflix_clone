import 'package:flutter/material.dart';

import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    required this.postersList,
    super.key,
  });

  final List<String>postersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top 10 Tv Shows In India today',
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              postersList.length,
              (index) => NumberCard(
                index: index,
                imageUrl: postersList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
