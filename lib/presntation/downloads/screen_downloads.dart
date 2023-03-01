import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presntation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List imagesList = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg'
    'https://www.themoviedb.org/t/p/w220_and_h330_face/kuf6dutpsT0vSVehic3EZIqkOBt.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        body: ListView(
          children: [
            Row(
              children: const [
                kWidth,
                Icon(
                  Icons.settings,
                  color: whiteColor,
                ),
                kWidth,
                Text(
                  'Smart Downloads',
                )
              ],
            ),
            const Text('Introduce Downloads for you'),
            const Text(
              'We will download a personalised selection of movies and shows for you,so there is always somthing to watch on your device',
            ),
            Container(
              width: size.width,
              height: size.width,
              color: whiteColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.37,
                  ),
                  DownloadsImageWidget(
                    
                    imagesList: imagesList[0],
                    margin: EdgeInsets.only(left: 130, bottom: 50),
                    angle: 20,
                    size: Size(
                      size.width * 0.4,
                      size.width * 0.58,
                    ),
                  ),
                  DownloadsImageWidget(
                    imagesList: imagesList[0],
                    margin: EdgeInsets.only(right: 130, bottom: 50),
                    angle: -20,
                    size: Size(
                      size.width * 0.4,
                      size.width * 0.58,
                    ),
                  ),
                  DownloadsImageWidget(
                    imagesList: imagesList[0],
                   
                    margin: EdgeInsets.only(bottom: 10),
                    angle: 0,
                    size: Size(
                      size.width * 0.5,
                      size.width * 0.65,
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              color: buttonBlueColor,
              onPressed: () {},
              child: const Text(
                'Set up',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            MaterialButton(
              color: buttonWhiteColor,
              onPressed: () {},
              child: const Text(
                'See what you can download',
                style: TextStyle(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imagesList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius=10,
  });

  final String imagesList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: blackColor,
          image: DecorationImage(
            image: NetworkImage(
              imagesList,
            ),
          ),
        ),
      ),
    );
  }
}
