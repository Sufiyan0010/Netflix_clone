import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
         icon,
          color: whiteColor,
          size: 25,
        ),
        Text(
          title,
          style:const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
