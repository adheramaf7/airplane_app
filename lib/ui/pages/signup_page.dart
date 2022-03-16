import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/ui/pages/bonus_page.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './../../shared/theme.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

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
      Widget nameInput() => CustomTextFormField(
            title: 'Full Name',
            hintText: 'Enter your full name',
            controller: nameController,
          );

      Widget emailInput() => CustomTextFormField(
            title: 'Email',
            hintText: 'Enter your email',
            controller: emailController,
          );

      Widget passwordInput() => CustomTextFormField(
            title: 'Password',
            hintText: 'Enter your password',
            obsecureText: true,
            controller: passwordController,
          );

      Widget hobbyInput() => CustomTextFormField(
            title: 'Hobby',
            hintText: 'Enter your hobby',
            controller: hobbyController,
          );

      Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BonusPage(state.user)),
                    (route) => false);
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: kRedColor,
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return CustomButton(
                title: 'Get Started',
                onPressed: () {
                  context.read<AuthCubit>().signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                      hobby: hobbyController.text);
                },
              );
            },
          );

      return Container(
        margin: const EdgeInsets.only(top: 25),
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
            submitButton()
          ],
        ),
      );
    }

    Widget signinButton() => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/signin');
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 30, bottom: 50),
            child: Text(
              'Have an account? Sign In.',
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline),
            ),
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
            signinButton(),
          ],
        ),
      ),
    );
  }
}
