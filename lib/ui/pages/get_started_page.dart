import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import './../../shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image_get_started.png'),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Fly like a Bird',
                style: whiteTextStyle.copyWith(fontSize: 32, fontWeight: bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Explore new world with us and let\nyourself get an amazing experiences',
                style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: light),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                title: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                width: 220,
                margin: const EdgeInsets.only(top: 50, bottom: 80),
              )
            ],
          ),
        )
      ]),
    );
  }
}
