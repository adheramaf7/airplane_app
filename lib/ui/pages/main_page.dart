import 'package:airplane_app/ui/widgets/custom_button_navigation.dart';
import 'package:flutter/material.dart';
import './../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                CustomButtonNavigation(
                    imagePath: 'assets/icon_home.png', isActive: true),
                CustomButtonNavigation(
                    imagePath: 'assets/icon_transaction.png'),
                CustomButtonNavigation(imagePath: 'assets/icon_payment.png'),
                CustomButtonNavigation(imagePath: 'assets/icon_setting.png'),
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
