import 'package:crud_firebase/domain/models/product_model.dart';
import 'package:crud_firebase/presentation/pages/home/widgets/form_content.dart';
import 'package:crud_firebase/presentation/providers/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/datasource/network/firestore_remote_data.dart';
import '../../../domain/repositories/firestore_repository_imp.dart';
import '../../../domain/usecases/firestore_usecase.dart';

class CreateAndEditProductPage extends StatefulWidget {
  const CreateAndEditProductPage({super.key, this.isNew});
  final bool? isNew;

  @override
  State<CreateAndEditProductPage> createState() =>
      _CreateAndEditProductPageState();
}

class _CreateAndEditProductPageState extends State<CreateAndEditProductPage> {
  Product product = Product();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.isNew == false) {
      product = ModalRoute.of(context)!.settings.arguments as Product;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirestoreProvider>(
      create: (context) => FirestoreProvider(
        FirestoreUsecase(
          FirestoreRepositoryImp(
            FirestoreServices(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.isNew == true ? "Crear producto" : "Editar"),
        ),
        body: FormDataContent(
          product: product,
          titleForm: widget.isNew == true ? "Crear producto" : "Editar",
        ),
      ),
    );
  }
}
