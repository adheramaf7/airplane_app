import 'package:airplane_app/ui/pages/checkout_page.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import './../../shared/theme.dart';
import './../../shared/enums.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() => Container(
          margin: EdgeInsets.only(top: 40),
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
                  status: SeatStatusEnum.unavailable,
                ),
                SeatItem(
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
                  status: SeatStatusEnum.selected,
                ),
                SeatItem(
                  status: SeatStatusEnum.selected,
                ),
              ],
            ),
          );

      Widget yourSeat() => Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your seat',
                  style: greyTextStyle.copyWith(fontWeight: light),
                ),
                Text(
                  'A3,B3',
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                )
              ],
            ),
          );

      Widget total() => Container(
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
                  'Rp 450.000.000',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                )
              ],
            ),
          );

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
            yourSeat(),
            total(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          CustomButton(
            title: 'Continue to Checkout',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()));
            },
            margin: const EdgeInsets.only(top: 30, bottom: 40),
          )
        ],
      ),
    );
  }
}
