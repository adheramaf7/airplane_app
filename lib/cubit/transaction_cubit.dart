import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());

      await TransactionService().createTransaction(transaction);

      emit(TransactionCreateSuccess());
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void getTransactionByUser(String userId) async {
    try {
      emit(TransactionLoading());

      List<TransactionModel> transctions =
          await TransactionService().getTransactionsByUser(userId);

      emit(TransactionFetchSuccess(transctions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
