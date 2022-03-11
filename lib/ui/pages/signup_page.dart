import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import './../../shared/theme.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() => Container(
          margin: const EdgeInsets.only(top: 30),
          child: Text(
            'Join us and get\nyour next journey',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
        );

    Widget inputSection() {
      Widget nameInput() => const CustomTextFormField(
            title: 'Full Name',
            hintText: 'Enter your full name',
          );

      Widget emailInput() => const CustomTextFormField(
            title: 'Email',
            hintText: 'Enter your email',
          );

      Widget passwordInput() => const CustomTextFormField(
            title: 'Password',
            hintText: 'Enter your password',
            obsecureText: true,
          );

      Widget hobbyInput() => const CustomTextFormField(
            title: 'Hobby',
            hintText: 'Enter your hobby',
          );

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            CustomButton(
              title: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, '/bonus');
              },
            ),
          ],
        ),
      );
    }

    Widget tacButton() => Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50, bottom: 73),
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
