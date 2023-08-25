import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/domain/models/product_model.dart';
import 'package:crud_firebase/domain/models/user_data_model.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Product>> listProducts() {
    return _firestore.collection('products').snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          return Product(
            id: doc.id,
            description: doc['description'],
            name: doc['name'],
            price: doc['price'],
            stock: doc['stock'],
          );
        }).toList();
      },
    );
  }

  Future<String?> createUser(UserDataModel user) async {
    try {
      await _firestore.collection("users").doc("${user.id}").set(user.toJson());
    } on FirebaseException catch (e) {
      return e.message!;
    }
    return null;
  }

  Future<void> createProduct(Product product) {
    return _firestore.collection('products').add(product.toJson());
  }

  Future<void> updateProduct(Product product) {
    return _firestore
        .collection('products')
        .doc("${product.id}")
        .update(product.toJson());
  }

  Future<void> deleteProduct(String productId) {
    return _firestore.collection('products').doc(productId).delete();
  }
}
