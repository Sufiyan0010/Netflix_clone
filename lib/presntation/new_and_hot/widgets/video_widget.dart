import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class Videowidget extends StatelessWidget {
  final String url;
  const Videowidget({
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: greyColor,
                    strokeWidth: 2,
                  ),
                );
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return Center(
                child: Stack(
                  
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
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_up,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
