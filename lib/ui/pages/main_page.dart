import 'package:airplane_app/cubit/page_cubit.dart';
import 'package:airplane_app/ui/pages/home_page.dart';
import 'package:airplane_app/ui/pages/setting_page.dart';
import 'package:airplane_app/ui/pages/transaction_page.dart';
import 'package:airplane_app/ui/pages/wallet_page.dart';
import 'package:airplane_app/ui/widgets/custom_button_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    imagePath: 'assets/icon_home.png', index: 0),
                CustomButtonNavigation(
                    imagePath: 'assets/icon_transaction.png', index: 1),
                CustomButtonNavigation(
                    imagePath: 'assets/icon_payment.png', index: 2),
                CustomButtonNavigation(
                    imagePath: 'assets/icon_setting.png', index: 3),
              ],
            ),
          ),
        );

    Widget buildContent(int currentIndex) {
      if (currentIndex == 0) {
        return HomePage();
      }

      if (currentIndex == 1) {
        return TransactionPage();
      }

      if (currentIndex == 2) {
        return WalletPage();
      }

      if (currentIndex == 3) {
        return SettingPage();
      }

      return HomePage();
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(state),
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
