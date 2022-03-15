import 'package:airplane_app/cubit/seat_cubit.dart';
import 'package:airplane_app/models/destinaton_model.dart';
import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/services/auth_service.dart';
import 'package:airplane_app/ui/pages/checkout_page.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/seat_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import './../../shared/theme.dart';
import './../../shared/enums.dart';

class ChooseSeatPage extends StatefulWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  @override
  void initState() {
    context.read<SeatCubit>().resetSelectedSeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget title() => Container(
          margin: const EdgeInsets.only(top: 40),
          child: Text(
            'Select Your\nFavorite Seat',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
        );

    Widget seatStatus() => Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icon_available.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Available',
                      style: blackTextStyle,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icon_selected.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Selected',
                      style: blackTextStyle,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icon_unavailable.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Unavailable',
                      style: blackTextStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
        );

    Widget selectSeat() {
      Widget seatIndicator() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    'A',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    'B',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    ' ',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    'C',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    'D',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ],
          );

      Widget seatPicker(int seatRowNumber) => Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(
                  id: 'A$seatRowNumber',
                  status: SeatStatusEnum.available,
                ),
                SeatItem(
                  id: 'B$seatRowNumber',
                  status: SeatStatusEnum.available,
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      seatRowNumber.toString(),
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                SeatItem(
                  id: 'C$seatRowNumber',
                  status: SeatStatusEnum.available,
                ),
                SeatItem(
                  id: 'D$seatRowNumber',
                  status: SeatStatusEnum.available,
                ),
              ],
            ),
          );

      Widget yourSeat(List<String> selectedSeats) => Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Your seat',
                  style: greyTextStyle.copyWith(fontWeight: light),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    selectedSeats.isNotEmpty ? selectedSeats.join(', ') : '-',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          );

      Widget total(int seatCount) => Container(
            margin: const EdgeInsets.only(top: 16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: greyTextStyle.copyWith(fontWeight: light),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(seatCount * widget.destination.price),
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                  // overflow: TextOv,
                )
              ],
            ),
          );

      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              children: [
                seatIndicator(),
                seatPicker(1),
                seatPicker(2),
                seatPicker(3),
                seatPicker(4),
                seatPicker(5),
                yourSeat(state),
                total(state.length),
              ],
            ),
          );
        },
      );
    }

    Future<bool> showConfirmDialog(BuildContext context) async {
      final selectedSeatsCount = context.read<SeatCubit>().state.length;

      if (selectedSeatsCount == 0) {
        return true;
      }

      final confirm = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: kBackgroundColor,
          title: Text(
            'Peringatan',
            style: redTextStyle.copyWith(fontWeight: semiBold),
          ),
          content: Text(
            'Kursi yang anda pilih akan direset jika anda menutup halaman ini!',
            style: blackTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('yes');
              },
              child: Text(
                'Lanjutkan',
                style: redTextStyle.copyWith(fontWeight: semiBold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('no');
              },
              child: Text(
                'Tidak, tetap di halaman ini',
                style: greenTextStyle.copyWith(fontWeight: semiBold),
              ),
            ),
          ],
        ),
      );

      return confirm == 'yes';
    }

    return WillPopScope(
      onWillPop: () async => await showConfirmDialog(context),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            seatStatus(),
            selectSeat(),
            BlocBuilder<SeatCubit, List<String>>(
              builder: (context, state) {
                return CustomButton(
                  title: 'Continue to Checkout',
                  onPressed: () {
                    final TransactionModel transaction = TransactionModel(
                      userId: AuthService().getCurrentUserId()!,
                      destination: widget.destination,
                      travelerCount: state.length,
                      selectedSeats: state,
                      vat: 0.10,
                      grandTotal:
                          (state.length * widget.destination.price * (1 + 0.10))
                              .toInt(),
                    );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage(transaction)));
                  },
                  margin: const EdgeInsets.only(top: 30, bottom: 40),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
