import 'package:crud_firebase/domain/models/product_model.dart';
import 'package:crud_firebase/domain/models/user_data_model.dart';
import 'package:crud_firebase/domain/usecases/firestore_usecase.dart';
import 'package:flutter/material.dart';

class FirestoreProvider extends ChangeNotifier {
  final FirestoreUsecase _firestoreUsecase;

  FirestoreProvider(this._firestoreUsecase);

  Stream<List<Product>> listenProducts() {
    return _firestoreUsecase.listUsecase();
  }

  Future<String?> createProduct(Product product) async {
    try {
      await _firestoreUsecase.createProductUsecase(product);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateProduct(Product product) async {
    try {
      await _firestoreUsecase.updateProductUsecase(product);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> createUser(UserDataModel user) async {
    return await _firestoreUsecase.createUser(user);
  }

  Future deleteProduct(String id) async {
    return await _firestoreUsecase.deletePRoductUsecase(id);
  }
}
