import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/services/auth_service.dart';
import 'package:airplane_app/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      await UserService()
          .cutBalance(transaction.userId, transaction.grandTotal);

      _transactionReference.add({
        'userId': transaction.userId,
        'destination': transaction.destination.toJson(),
        'travelerCount': transaction.travelerCount,
        'selectedSeats': transaction.selectedSeats.toList(),
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransactionsByUser(String userId) async {
    try {
      QuerySnapshot result =
          await _transactionReference.where('userId', isEqualTo: userId).get();

      List<TransactionModel> transactions = result.docs
          .map((e) =>
              TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
