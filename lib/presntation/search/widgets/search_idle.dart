import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presntation/search/widgets/title.dart';

import '../../../core/constants.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/i6zyJ18xvVvqbN6eUdzgSwlhb8h.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     const  searchTitle(title: 'Top Searches',),
        khieght,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchTile(),
            separatorBuilder: (ctx, index) => const SizedBox(
              height: 15,
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}



class TopSearchTile extends StatelessWidget {
  const TopSearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
              color: whiteColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(
          Icons.play_circle_fill,
          color: whiteColor,
          size: 35,
        ),
      ],
    );
  }
}
