import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/bloc/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presntation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(5),
        itemBuilder: (ctx, index) => _widgetList[index],
        separatorBuilder: (ctx, index) => const SizedBox(
          height: 20,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "We will download a personalised selection of movies and shows for you,so there's always somthing to watch on your device",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
        khieght,
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          try {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: greyColor,
                      ),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.38,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                        DownloadsImageWidget(
                          imagesList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(
                            left: 160,
                            top: 50,
                          ),
                          angle: 25,
                          size: Size(
                            size.width * 0.35,
                            size.width * 0.55,
                          ),
                        ),
                        DownloadsImageWidget(
                          imagesList:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(
                            right: 160,
                            top: 50,
                          ),
                          angle: -25,
                          size: Size(
                            size.width * 0.35,
                            size.width * 0.55,
                          ),
                        ),
                        DownloadsImageWidget(
                          imagesList:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(
                            bottom: 40,
                            top: 50,
                          ),
                          angle: 0,
                          size: Size(
                            size.width * 0.4,
                            size.width * 0.6,
                          ),
                        )
                      ],
                    ),
            );
          } catch (e) {
            return const CircularProgressIndicator(
              color: greyColor,
            );
          }
        }),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: buttonBlueColor,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        khieght,
        MaterialButton(
          color: buttonWhiteColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                color: blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imagesList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  final String imagesList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: blackColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imagesList,
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
