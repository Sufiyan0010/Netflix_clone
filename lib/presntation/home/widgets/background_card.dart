import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/bloc/downloads_bloc.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import 'custom_button.dart';

class BackroundCard extends StatelessWidget {
  const BackroundCard({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    return Stack(
      children: [
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 8 / 10,
              decoration:  BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('$imageAppendUrl${state.downloads[1].posterPath}'),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: 'My List',
                  icon: Icons.add,
                ),
                _PlayButton(),
                const CustomButtonWidget(
                  icon: Icons.info,
                  title: 'Info',
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(whiteColor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: blackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: blackColor),
        ),
      ),
    );
  }
}
