import 'package:airplane_app/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'travelerCount': transaction.travelerCount,
        'selectedSeats': transaction.selectedSeats.toList(),
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> destinations = result.docs
          .map((e) =>
              TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
