import 'package:admin_aplication/data/models/category_model.dart';
import 'package:admin_aplication/widgets/toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore;
  CategoryRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addCateegory({required CategoryModel categoryModel}) async {
    try {
      DocumentReference newCategory =
          await _firestore.collection("categories").add(categoryModel.toJson());
      await _firestore
          .collection("categories")
          .doc(newCategory.id)
          .update({"categoryId": newCategory.id});
      getMyToast(message: 'Kategotiya muvaffaqiyatli saqlandi');
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  Future<void> deleteCategory({required String docId}) async {
    try {
      await _firestore.collection("categories").doc(docId).delete();
      getMyToast(message: "Kategotiya muvaffaqiyatli o'chirildi");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  Future<void> updateCategory({required CategoryModel categoryModel}) async {
    try {
      await _firestore
          .collection("categories")
          .doc(categoryModel.categoryId)
          .update(categoryModel.toJson());
          getMyToast(message: "Kategorya muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  Stream<List<CategoryModel>> getCategoties() => _firestore
      .collection("categories")
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList());
}
