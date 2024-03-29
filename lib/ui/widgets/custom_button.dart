import 'package:flutter/material.dart';
import './../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double width;
  final EdgeInsets margin;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.width = double.infinity,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      ),
    );
  }
}
