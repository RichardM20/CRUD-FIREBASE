import 'package:crud_firebase/domain/models/product_model.dart';
import 'package:crud_firebase/domain/models/user_data_model.dart';

abstract class FirestoreRepository {
  Stream<List<Product>> listProducts();
  Future<void> createProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String productId);
  Future<String?> createUser(UserDataModel user);
}
