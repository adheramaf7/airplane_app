import 'package:flutter/material.dart';
import 'package:airplane_app/shared/theme.dart';

class CustomButtonNavigation extends StatelessWidget {
  final String imagePath;
  final bool isActive;

  const CustomButtonNavigation({Key? key, required this.imagePath, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
              color: isActive ? kPrimaryColor : kTransparentColor,
              borderRadius: BorderRadius.circular(defaultRadius)),
        )
      ],
    );
  }
}
