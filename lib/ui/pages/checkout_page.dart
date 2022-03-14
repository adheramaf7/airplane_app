import 'package:airplane_app/ui/widgets/booking_detail_item.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import './../../shared/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

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
                      image: AssetImage('assets/image_destination1.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lake Ciliwung',
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      Text(
                        'Tangerang',
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
                      '4.7',
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
              value: '2 Person',
            ),
            BookingDetailItem(
              title: 'Seat',
              value: 'A3,B3',
            ),
            BookingDetailItem(
              title: 'Insurance',
              value: 'YES',
              color: kGreenColor,
            ),
            BookingDetailItem(
              title: 'Refundable',
              value: 'NO',
              color: kRedColor,
            ),
            BookingDetailItem(
              title: 'VAT',
              value: '45%',
            ),
            BookingDetailItem(
              title: 'Price',
              value: 'Rp 2.000.000',
            ),
            BookingDetailItem(
              title: 'Grand Total',
              value: 'Rp 4.000.000',
              color: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetail() => Container(
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
                        'Rp 4.000.000',
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
          CustomButton(
            title: 'Pay Now',
            onPressed: () {},
          ),
          tacText()
        ],
      ),
    );
  }
}
