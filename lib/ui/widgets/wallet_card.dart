import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import './../../shared/theme.dart';

class WalletCard extends StatelessWidget {
  final UserModel user;

  const WalletCard(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      user.name,
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
            NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(user.balance),
            style: whiteTextStyle.copyWith(
              fontSize: 26,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
