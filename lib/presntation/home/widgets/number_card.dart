import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import '../../../core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.index,
    required this.imageUrl,
  });
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
                height: 150,
              ),
              Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: kRadius10,
                  image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                     imageUrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 5,
            bottom: -15,
            child: BorderedText(
              strokeWidth: 5,
              strokeColor: whiteColor,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: blackColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
