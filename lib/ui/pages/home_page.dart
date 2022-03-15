import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/destination_cubit.dart';
import 'package:airplane_app/models/destinaton_model.dart';
import 'package:airplane_app/ui/widgets/destination_card.dart';
import 'package:airplane_app/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().getDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() => BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              final user = state.user;
              return Container(
                margin: EdgeInsets.only(
                    left: defaultMargin, right: defaultMargin, top: 30),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Howdy,\n${user.name}",
                            style: blackTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Where to fly today?',
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: light),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/image_profile.png'),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        );

    Widget popularDestination(List<DestinationModel> destinations) => Container(
          margin: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: destinations
                  .map((destination) => DestinationCard(
                        destination: destination,
                      ))
                  .toList(),
            ),
          ),
        );

    Widget newDestinations(List<DestinationModel> destinations) => Container(
          margin: EdgeInsets.only(
              top: 30, left: defaultMargin, right: defaultMargin, bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New This Year',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              ...destinations
                  .map((destination) => DestinationTile(
                        destination: destination,
                      ))
                  .toList(),
            ],
          ),
        );

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestinations(state.destinations),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
