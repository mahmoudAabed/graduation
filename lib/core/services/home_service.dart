import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/cart_activity_model.dart';

class HomeService {
  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection('category');

  final CollectionReference _activityCollectionReference =
      FirebaseFirestore.instance.collection('activityimage');

  final CollectionReference _cartActivityCollectionReference =
      FirebaseFirestore.instance.collection('activityCart');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionReference.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getActivity() async {
    var value = await _activityCollectionReference.get();
    return value.docs;
  }

  Future<void> addActivity(var data) async {
    await _activityCollectionReference.add(data);
    return;
  }

  Future<List<QueryDocumentSnapshot>> getCart() async {
    var value = await _cartActivityCollectionReference.get();
    return value.docs;
  }
}
