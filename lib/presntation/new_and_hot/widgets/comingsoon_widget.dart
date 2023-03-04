import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button.dart';
import 'video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "FEB",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: greyColor),
                ),
                Text(
                  "11",
                  style: TextStyle(
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
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
              const Videowidget(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Money Heist',
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: -1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
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
              const Text("Coming on friday"),
              khieght,
              const Text(
                'Money Heist',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              khieght,
              const Text(
                'Landing the lead in the school musical is a dream come true for jodi,until the pressure sends her confidence--and her relationship--into a tailspin',
                style: TextStyle(
                  color: greyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
