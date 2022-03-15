import 'package:airplane_app/ui/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import './../../shared/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: WalletCard(),
    );
  }
}
