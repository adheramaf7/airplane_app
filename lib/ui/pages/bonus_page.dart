import 'package:airplane_app/models/user_model.dart';
import 'package:airplane_app/ui/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import './../../shared/theme.dart';

class BonusPage extends StatelessWidget {
  final UserModel user;

  const BonusPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          WalletCard(user),
          title(),
          subtitle(),
          CustomButton(
            title: 'Start Fly Now',
            width: 220,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            },
            margin: const EdgeInsets.only(top: 50),
          ),
        ],
      )),
    );
  }
}
