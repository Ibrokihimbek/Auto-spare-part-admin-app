import 'package:admin_aplication/data/models/info_model.dart';
import 'package:admin_aplication/widgets/toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfoStoreRepository {
  final FirebaseFirestore _firestore;

  InfoStoreRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  /// Add Info Store

  Future<void> addInfoStore({required InfoModel infoModel}) async {
    try {
      DocumentReference newInfo =
          await _firestore.collection('infoStore').add(infoModel.toJson());
      await _firestore
          .collection('infoStore')
          .doc(newInfo.id)
          .update({"infoId": newInfo.id});
      getMyToast(message: "Do'kon haqidagi ma'lumot muvaffaqiyatli saqlandi");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  /// Update Info Store

  Future<void> updateInfoStore({required InfoModel infoModel}) async {
    try {
      await _firestore
          .collection("infoStore")
          .doc(infoModel.infoId)
          .update(infoModel.toJson());
      getMyToast(message: "Do'kon haqidagi ma'lumot muvaffaqiyatli yangilandi");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  Stream<List<InfoModel>> getInfo() =>
      _firestore.collection('infoStore').snapshots().map((event) =>
          event.docs.map((e) => InfoModel.formJson(e.data())).toList());
}
