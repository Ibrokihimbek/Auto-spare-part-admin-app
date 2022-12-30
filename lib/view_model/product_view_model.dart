import 'dart:async';

import 'package:admin_aplication/data/app_repositroy/products_repository.dart';
import 'package:admin_aplication/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository productRepository;
  ProductViewModel({required this.productRepository}) {
    listenProducts("");
  }

  late StreamSubscription subscription;

  List<ProductModel> products = [];
  List<ProductModel> productsAdmin = [];
  ProductModel? product;

  listenProducts(String categoryId) async {
    subscription = productRepository
        .getProducts(categoryId: categoryId)
        .listen((allProducts) {
      if (categoryId.isEmpty) productsAdmin = allProducts;
      products = allProducts;
      notifyListeners();
    });
  }

  addProduct(ProductModel productModel) =>
      productRepository.addProduct(productModel: productModel);

  updateProduct(ProductModel productModel) =>
      productRepository.updateProduct(productModel: productModel);

  deleteProduct(String docId) => productRepository.deleteProduct(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
