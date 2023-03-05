import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import '../../core/constants.dart';
import 'widgets/comingsoon_widget.dart';
import 'widgets/everyons_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kWidth
            ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: whiteColor,
                labelColor: blackColor,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                indicator:
                    BoxDecoration(color: whiteColor, borderRadius: kRadius30),
                tabs: const [
                  Tab(
                    text: '🍿Coming Soon',
                  ),
                  Tab(
                    text: "👀Everyon's Watching",
                  ),
                ]),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingsoonList(
              key: Key('coming_soon'),
            ),
            EveryonesWatchingList(
              key: Key(
                'Everyone_is_watching',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ComingsoonList extends StatelessWidget {
  const ComingsoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: greyColor,
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text(
                'Error while loading',
              ),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text(
                'list is empty',
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: state.comingSoonList.length,
              itemBuilder: ((context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formatedDate =
                      DateFormat.yMMMMd('en_US').format(_date!);

                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  backdropPath: '$imageAppendUrl${movie.backdropPath}',
                  movieName: movie.originalTitle ?? 'NO Title Found',
                  description: movie.overview ?? 'No Description found',
                );
              }),
            );
          }
        },
      ),
    );
  }
}

class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEvereyOneWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEvereyOneWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: greyColor,
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text(
                'Error while loading',
              ),
            );
          } else if (state.evreyOneIsWathingList.isEmpty) {
            return const Center(
              child: Text(
                'list is empty',
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.evreyOneIsWathingList.length,
              itemBuilder: ((context, index) {
                final movie = state.evreyOneIsWathingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                final tv = state.evreyOneIsWathingList[index];

                return EveryonsWatchingwidget(
                  backdropPath: '$imageAppendUrl${tv.backdropPath}',
                  description: tv.overview ?? 'No Description Found',
                  movieName: tv.originalName ?? 'No Title Found',
                );
              }),
            );
          }
        },
      ),
    );
  }
}
