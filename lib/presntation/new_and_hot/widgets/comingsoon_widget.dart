import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button.dart';
import 'video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String backdropPath;
  final String description;
  final String movieName;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.backdropPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              month,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: greyColor),
            ),
            Text(
              day,
              style: const TextStyle(
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            )
          ]),
        ),
        SizedBox(
          width: size.width - 50,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Videowidget(url: backdropPath,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow:TextOverflow.ellipsis ,
                      style: const TextStyle(
                        fontSize: 20,
                        color: greyColor,
                       
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.alarm,
                        title: 'Remind me',
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'info',
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth
                    ],
                  )
                ],
              ),
              khieght,
              Text("Coming on $day $month"),
              khieght,
              Text(
                movieName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              khieght,
              Expanded(
                child: Text(
                  description,
                  maxLines: 5,
                  style: const TextStyle(
                    color: greyColor,
                  ),
                ),
              ),
               
            ],
          ),
        ),
      ],
    );
  }
}
