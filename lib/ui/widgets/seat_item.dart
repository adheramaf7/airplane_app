import 'package:flutter/material.dart';
import './../../shared/theme.dart';
import './../../shared/enums.dart';

class SeatItem extends StatelessWidget {
  final SeatStatusEnum status;

  const SeatItem({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (status) {
        case SeatStatusEnum.available:
          return kAvailableColor;

        case SeatStatusEnum.selected:
          return kPrimaryColor;

        case SeatStatusEnum.unavailable:
          return kUnavailableColor;

        default:
          return kUnavailableColor;
      }
    }

    borderColor() {
      switch (status) {
        case SeatStatusEnum.available:
          return kPrimaryColor;

        case SeatStatusEnum.selected:
          return kTransparentColor;

        case SeatStatusEnum.unavailable:
          return kTransparentColor;

        default:
          return kTransparentColor;
      }
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor(),
          width: 2,
        ),
      ),
      child: (status == SeatStatusEnum.selected)
          ? Center(
              child: Text(
                'YOU',
                style: whiteTextStyle.copyWith(fontWeight: semiBold),
              ),
            )
          : null,
    );
  }
}
