import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './../../shared/theme.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() => Container(
          margin: const EdgeInsets.only(top: 30),
          child: Text(
            'Sign In With Your\nExisting Account',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
        );

    Widget inputSection() {
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

      Widget submitButton() => BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              } else if (state is AuthFailed) {
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
                title: 'Sign In',
                onPressed: () {
                  context.read<AuthCubit>().signIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
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
          children: [emailInput(), passwordInput(), submitButton()],
        ),
      );
    }

    Widget signupButton() => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 30, bottom: 50),
            child: Text(
              'Don\'t have an account? Sign Up.',
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
            signupButton(),
          ],
        ),
      ),
    );
  }
}
