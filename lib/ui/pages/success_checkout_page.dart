import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/page_cubit.dart';
import 'package:airplane_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import './../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image_success.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Well Booked 😍',
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Are you ready to explore the new\nworld of experiences?',
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            title: 'My Bookings',
            onPressed: () {
              context.read<PageCubit>().setPage(1);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            },
            width: 220,
          )
        ],
      )),
    );
  }
}
