import 'package:airplane_app/shared/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconButtonNav(String assetPath, {bool isActive = false}) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(assetPath),
                ),
              ),
            ),
            Container(
              width: 30,
              height: 2,
              decoration: BoxDecoration(
                  color: isActive ? kPrimaryColor : kTransparentColor,
                  borderRadius: BorderRadius.circular(defaultRadius)),
            )
          ],
        );

    Widget customButtonNavigation() => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
                bottom: 30, left: defaultMargin, right: defaultMargin),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconButtonNav('assets/icon_home.png', isActive: true),
                iconButtonNav('assets/icon_transaction.png', isActive: false),
                iconButtonNav('assets/icon_payment.png', isActive: false),
                iconButtonNav('assets/icon_setting.png', isActive: false),
              ],
            ),
          ),
        );

    return Scaffold(
      body: Stack(
        children: [Text('Main Page'), customButtonNavigation()],
      ),
    );
  }
}
