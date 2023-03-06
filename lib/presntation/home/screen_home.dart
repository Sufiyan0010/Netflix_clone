import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presntation/home/widgets/background_card.dart';
import '../widgets/main_title_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrolNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: greyColor,
                    strokeWidth: 2,
                  ),
                );
              } else if (state.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: const [
                          CircularProgressIndicator(
                            color: greyColor,
                            strokeWidth: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.wifi_off_outlined,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                      khieght,
                      const Text(
                        'NetWork Error',
                        style: TextStyle(
                          color: greyColor,
                        ),
                      )
                    ],
                  ),
                );
              }
              // released past year
              final releasdPastYear = state.pastYearMovieList.map((m) {
                return '$imageAppendUrl${m.posterPath}';
              }).toList();
              releasdPastYear.shuffle();

              // trending
              final trending = state.trendingMovieList.map((m) {
                return '$imageAppendUrl${m.posterPath}';
              }).toList();
              trending.shuffle();

              // tense dramas
              final tenseDramas = state.tenseDramasMovieList.map((m) {
                return '$imageAppendUrl${m.posterPath}';
              }).toList();
             // tenseDramas.shuffle();

              //south indian movies
              final southIndianMovies = state.southIndianMovieList.map((m) {
                return '$imageAppendUrl${m.posterPath}';
              }).toList();
              southIndianMovies.shuffle();

              //top 10 shows
              final top10TvShows = state.trendingTvList.map((t) {
                return '$imageAppendUrl${t.posterPath}';
              }).toList();
              top10TvShows.shuffle();

              //listview
              return ListView(
                children: [
                  const BackroundCard(),
                  if (releasdPastYear.length >= 10)
                    MainTitleCard(
                      title: 'Released in the past year',
                      posterList: releasdPastYear.sublist(0, 10),
                    ),
                  khieght,
                  if (trending.length >= 10)
                    MainTitleCard(
                      title: 'Trending Now',
                      posterList: trending.sublist(0, 10),
                    ),
                  khieght,
                  if (top10TvShows.length >= 10)
                    NumberTitleCard(
                      postersList: top10TvShows.sublist(0, 10),
                      
                    ),
                  khieght,
                  if (tenseDramas.length >= 10)
                    MainTitleCard(
                      title: 'Tense Drams',
                      posterList: tenseDramas.sublist(0, 10),
                    ),
                  khieght,
                  if (southIndianMovies.length >= 10)
                    MainTitleCard(
                      title: 'South Indian Cinema',
                      posterList: southIndianMovies.sublist(0, 10),
                    ),
                  khieght,
                ],
              );
            },
          ),
          scrolNotifier.value == true
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  width: double.infinity,
                  height: 70,
                  color: Colors.black.withOpacity(0.2),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png"),
                              ),
                            ),
                          ),
                          const Spacer(),
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Tv series',
                            style: kHometextTitle,
                          ),
                          Text(
                            'Movies',
                            style: kHometextTitle,
                          ),
                          Text(
                            'Categories',
                            style: kHometextTitle,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : khieght
        ],
      ),
    );
  }
}
