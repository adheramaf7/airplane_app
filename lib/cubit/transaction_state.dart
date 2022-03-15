part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionCreateSuccess extends TransactionState {}
class TransactionFetchSuccess extends TransactionState {
  final List<TransactionModel> transactions;

  TransactionFetchSuccess(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionFailed extends TransactionState {
  final String message;

  TransactionFailed(this.message);

  @override
  List<Object> get props => [message];
}
