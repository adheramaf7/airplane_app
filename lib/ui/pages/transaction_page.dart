import 'package:airplane_app/cubit/transaction_cubit.dart';
import 'package:airplane_app/services/auth_service.dart';
import 'package:airplane_app/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './../../shared/theme.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    String userId = AuthService().getCurrentUserId()!;
    context.read<TransactionCubit>().getTransactionByUser(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TransactionFetchSuccess) {
          final transactions = state.transactions;

          if (transactions.isEmpty) {
            return Center(
              child: Text(
                'Anda belum melakukan transaksi',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            );
          }

          return Container(
            margin: const EdgeInsets.only(bottom: 110, top: 30),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              itemBuilder: (context, index) =>
                  TransactionCard(transactions[index]),
              itemCount: transactions.length,
            ),
          );
        }

        return Center(
          child: Text(
            'Failed to Fetch Transaction Data',
            style: redTextStyle,
          ),
        );
      },
    );
  }
}
