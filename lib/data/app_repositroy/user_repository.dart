import 'package:admin_aplication/data/models/user_model.dart';
import 'package:admin_aplication/widgets/toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersRepository {
  final FirebaseFirestore _firestore;

  UsersRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;


  Future<void> deleteUser({required String docId}) async {
    try {
      await _firestore.collection("users").doc(docId).delete();
      getMyToast(message: "User muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (er) {
      getMyToast(message: er.message.toString());
    }
  }

  Stream<List<UserModel>> getUsers() =>
      _firestore.collection("users").snapshots().map(
            (event1) => event1.docs
                .map((doc) => UserModel.fromJson(doc.data()))
                .toList(),
          );
}
