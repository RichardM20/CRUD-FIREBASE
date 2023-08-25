import 'package:crud_firebase/data/datasource/network/firestore_remote_data.dart';
import 'package:crud_firebase/data/repositories/firestore_repository.dart';
import 'package:crud_firebase/domain/models/product_model.dart';
import 'package:crud_firebase/domain/models/user_data_model.dart';

class FirestoreRepositoryImp implements FirestoreRepository {
  late final FirestoreServices _firestoreServices;
  FirestoreRepositoryImp(this._firestoreServices);
  @override
  Future<void> createProduct(Product product) {
    return _firestoreServices.createProduct(product);
  }

  @override
  Future<void> deleteProduct(String productId) {
    return _firestoreServices.deleteProduct(productId);
  }

  @override
  Stream<List<Product>> listProducts() {
    return _firestoreServices.listProducts();
  }

  @override
  Future<void> updateProduct(Product product) {
    return _firestoreServices.updateProduct(product);
  }

  @override
  Future<String?> createUser(UserDataModel userDataModel) {
    return _firestoreServices.createUser(userDataModel);
  }
}
