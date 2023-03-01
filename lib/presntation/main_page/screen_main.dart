import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presntation/fast_laugh/screen_fastlaugh.dart';
import 'package:netflix_clone/presntation/home/screen_home.dart';
import 'package:netflix_clone/presntation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presntation/search/screen_search.dart';
import 'package:netflix_clone/presntation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presntation/downloads/screen_downloads.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});
  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    const ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
