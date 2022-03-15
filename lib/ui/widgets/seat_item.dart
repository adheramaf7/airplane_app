import 'package:airplane_app/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import './../../shared/theme.dart';
import './../../shared/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final SeatStatusEnum status;
  final String id;

  const SeatItem({
    Key? key,
    required this.id,
    this.status = SeatStatusEnum.available,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (isSelected) {
        return kPrimaryColor;
      }

      switch (status) {
        case SeatStatusEnum.available:
          return kAvailableColor;

        case SeatStatusEnum.unavailable:
          return kUnavailableColor;

        default:
          return kUnavailableColor;
      }
    }

    borderColor() {
      if (isSelected) {
        return kTransparentColor;
      }

      switch (status) {
        case SeatStatusEnum.available:
          return kPrimaryColor;

        case SeatStatusEnum.unavailable:
          return kTransparentColor;

        default:
          return kTransparentColor;
      }
    }

    return GestureDetector(
      onTap: () {
        if (status == SeatStatusEnum.available) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
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
        child: (isSelected)
            ? Center(
                child: Text(
                  'YOU',
                  style: whiteTextStyle.copyWith(fontWeight: semiBold),
                ),
              )
            : null,
      ),
    );
  }
}
