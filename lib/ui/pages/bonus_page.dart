import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import './../../shared/theme.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() => Container(
          width: 300,
          height: 211,
          padding: EdgeInsets.all(defaultMargin),
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/image_card.png'),
              ),
              boxShadow: [
                BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10)),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: whiteTextStyle.copyWith(fontWeight: light),
                        ),
                        Text(
                          'Kezie Annie',
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_plane.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Pay',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 41,
              ),
              Text(
                'Balance',
                style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: light),
              ),
              Text(
                'IDR 280.000.000',
                style: whiteTextStyle.copyWith(
                  fontSize: 26,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        );

    Widget title() => Container(
          margin: const EdgeInsets.only(top: 80),
          child: Text(
            'Big Bonus 🎉',
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
          ),
        );

    Widget subtitle() => Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            'We give you early credit so that\nyou can buy a flight ticket',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
            ),
            textAlign: TextAlign.center,
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bonusCard(),
          title(),
          subtitle(),
          CustomButton(
            title: 'Start Fly Now',
            width: 220,
            onPressed: () {
              Navigator.pushNamed(context, '/main');
            },
            margin: const EdgeInsets.only(top: 50),
          ),
        ],
      )),
    );
  }
}
