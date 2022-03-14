import 'package:flutter/material.dart';
import './../../shared/theme.dart';

class BookingDetailItem extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const BookingDetailItem({
    Key? key,
    required this.title,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(
                fontWeight: semiBold, color: color ?? kBlackColor),
          ),
        ],
      ),
    );
  }
}
