import 'package:crud_firebase/domain/models/product_model.dart';
import 'package:crud_firebase/domain/models/user_data_model.dart';
import 'package:crud_firebase/domain/repositories/firestore_repository_imp.dart';

class FirestoreUsecase {
  final FirestoreRepositoryImp _repository;

  FirestoreUsecase(this._repository);

  Future<String?> createUser(UserDataModel user) {
    return _repository.createUser(user);
  }

  Stream<List<Product>> listUsecase() {
    return _repository.listProducts();
  }

  Future<void> updateProductUsecase(Product product) {
    return _repository.updateProduct(product);
  }

  Future<void> createProductUsecase(Product product) {
    return _repository.createProduct(product);
  }

  Future<void> deletePRoductUsecase(String productId) {
    return _repository.deleteProduct(productId);
  }
}
