import 'package:airplane_app/ui/pages/choose_seat_page.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/interest_item.dart';
import 'package:airplane_app/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import './../../shared/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget coverImage() => Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image_destination1.png'),
            ),
          ),
        );

    Widget customShadow() => Container(
          height: 214,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 236),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );

    Widget content() {
      Widget emblem() => Container(
            width: 108,
            height: 24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/icon_emblem.png'),
              ),
            ),
          );

      Widget bannerTitle() => Container(
            margin: const EdgeInsets.only(
              top: 256,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lake Ciliwung',
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        'Tangerang',
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
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
                      style: whiteTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ),
              ],
            ),
          );

      Widget aboutCard() => Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                  style: blackTextStyle.copyWith(height: 2),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Photos',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    PhotoItem(
                      imagePath: 'assets/image_photo1.png',
                    ),
                    PhotoItem(
                      imagePath: 'assets/image_photo2.png',
                    ),
                    PhotoItem(
                      imagePath: 'assets/image_photo3.png',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Interests',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    InterestItem(
                      title: 'Kids Park',
                    ),
                    InterestItem(
                      title: 'Honor Bridge',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InterestItem(
                      title: 'City Museum',
                    ),
                    InterestItem(
                      title: 'Central Mall',
                    ),
                  ],
                ),
              ],
            ),
          );

      Widget footerPriceButton() => Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rp 12.500.000',
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'per orang',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                ),
                CustomButton(
                  title: 'Book Now',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseSeatPage()));
                  },
                  width: 170,
                )
              ],
            ),
          );

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [emblem(), bannerTitle(), aboutCard(), footerPriceButton()],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            coverImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
