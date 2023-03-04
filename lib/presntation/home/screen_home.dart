import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presntation/home/widgets/background_card.dart';
import '../widgets/main_title_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrolNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrolNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrolNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrolNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackroundCard(),
                    MainTitleCard(
                      title: 'Released in the past year',
                    ),
                    khieght,
                    MainTitleCard(
                      title: 'Trending Now',
                    ),
                    khieght,
                    NumberTitleCard(),
                    khieght,
                    MainTitleCard(
                      title: 'Tense Drams',
                    ),
                    khieght,
                    MainTitleCard(
                      title: 'South Indian Cinema',
                    ),
                    khieght,
                  ],
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
        },
      ),
    );
  }
}
