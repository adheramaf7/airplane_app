import 'package:airplane_app/models/destinaton_model.dart';
import 'package:airplane_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  final CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> getDestinations() async {
    try {
      QuerySnapshot result = await _destinationReference.get();

      List<DestinationModel> destinations = result.docs
          .map((e) =>
              DestinationModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      return destinations;
    } catch (e) {
      rethrow;
    }
  }
}
