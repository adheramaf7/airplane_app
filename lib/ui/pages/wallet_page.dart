import 'package:flutter/material.dart';
import './../../shared/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text(
          'Transaction Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
