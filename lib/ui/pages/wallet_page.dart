import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/services/auth_service.dart';
import 'package:airplane_app/ui/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import './../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    String userId = AuthService().getCurrentUserId()!;
    context.read<AuthCubit>().getCurrentUser(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AuthSuccess) {
          return Center(
            child: WalletCard(state.user),
          );
        }

        return Center(
          child: Text(
            'Gagal Memuat Wallet...',
            style: blackTextStyle,
          ),
        );
      },
    );
  }
}
