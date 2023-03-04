import 'package:flutter/material.dart';
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
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryoneWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ((context, index) => const ComingSoonWidget()),
    );
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonsWatchingwidget(),
    );
  }
}
