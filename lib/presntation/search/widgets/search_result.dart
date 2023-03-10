import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presntation/search/widgets/title.dart';

import '../../../application/search/search_bloc.dart';

class SerachResultwidget extends StatelessWidget {
  const SerachResultwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const searchTitle(title: 'Movies & Tv'),
        khieght,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                children: List.generate(
                  20,
                  (index) {
                    final movie = state.searchResultList[index];
                    return MainCard(imageUrl: movie.posterImageUrl);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.lime,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
