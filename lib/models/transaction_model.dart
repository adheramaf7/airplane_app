import 'package:airplane_app/models/destinaton_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int travelerCount;
  final List<dynamic> selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int grandTotal;

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        destination: DestinationModel.fromJson(
            json['destination']['id'], json['destination']),
        travelerCount: json['travelerCount'],
        selectedSeats: json['selectedSeats'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        grandTotal: json['grandTotal'],
      );

  TransactionModel(
      {required this.destination,
      required this.travelerCount,
      required this.selectedSeats,
      this.id = '',
      this.insurance = false,
      this.refundable = false,
      this.vat = 0,
      required this.grandTotal});

  @override
  List<Object?> get props => [
        destination,
        travelerCount,
        selectedSeats,
        insurance,
        refundable,
        vat,
        grandTotal
      ];
}
