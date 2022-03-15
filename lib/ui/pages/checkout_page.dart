import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/transaction_cubit.dart';
import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/ui/pages/success_checkout_page.dart';
import 'package:airplane_app/ui/widgets/booking_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_button.dart';
import './../../shared/theme.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() => Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 65,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/image_checkout.png'),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CGK',
                            style: blackTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold),
                          ),
                          Text(
                            'Tangerang',
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: light),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'SBY',
                            style: blackTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold),
                          ),
                          Text(
                            'Surabaya',
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: light),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );

    Widget destinationDetail() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaction.destination.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Booking Details',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            BookingDetailItem(
              title: 'Traveler',
              value: '${transaction.travelerCount} Person',
            ),
            BookingDetailItem(
              title: 'Seat',
              value: transaction.selectedSeats.join(', '),
            ),
            BookingDetailItem(
              title: 'Insurance',
              value: transaction.insurance ? 'YES' : 'NO',
              color: transaction.insurance ? kGreenColor : kRedColor,
            ),
            BookingDetailItem(
              title: 'Refundable',
              value: transaction.refundable ? 'YES' : 'NO',
              color: transaction.refundable ? kGreenColor : kRedColor,
            ),
            BookingDetailItem(
              title: 'VAT',
              value: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            ),
            BookingDetailItem(
              title: 'Price',
              value: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.destination.price),
            ),
            BookingDetailItem(
              title: 'Grand Total',
              value: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.grandTotal),
              color: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetail() => BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image_card.png'),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/icon_plane.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Pay',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state is AuthSuccess
                                ? NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(state.user.balance)
                                : 'Loading...',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Current Balance',
                            style: greyTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                            ),
                          )
                        ],
                      ))
                    ],
                  )
                ],
              ),
            );
          },
        );

    Widget tacText() => Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: Text(
              'Terms and Conditions',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          destinationDetail(),
          paymentDetail(),
          const SizedBox(
            height: 30,
          ),
          BlocConsumer<TransactionCubit, TransactionState>(
            listener: (context, state) {
              if (state is TransactionCreateSuccess) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessCheckoutPage(),
                    ),
                    (route) => false);
              } else if (state is TransactionFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: kRedColor,
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              return state is TransactionLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      title: 'Pay Now',
                      onPressed: () {
                        context
                            .read<TransactionCubit>()
                            .createTransaction(transaction);
                      },
                    );
            },
          ),
          tacText()
        ],
      ),
    );
  }
}
