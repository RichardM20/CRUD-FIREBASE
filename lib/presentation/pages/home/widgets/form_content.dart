import 'package:crud_firebase/domain/models/product_model.dart';
import 'package:crud_firebase/presentation/dialogs/generic.dart';
import 'package:crud_firebase/presentation/providers/button_loading_provider.dart';
import 'package:crud_firebase/presentation/providers/firestore_provider.dart';
import 'package:crud_firebase/presentation/widgets/button_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_edit_create.dart';

class FormDataContent extends StatefulWidget {
  const FormDataContent({
    super.key,
    required this.titleForm,
    this.product,
  });
  final String titleForm;
  final Product? product;

  @override
  State<FormDataContent> createState() => _FormDataContentState();
}

class _FormDataContentState extends State<FormDataContent> {
  final nameController = TextEditingController();

  final priceController = TextEditingController();

  final stockController = TextEditingController();

  final descriptionController = TextEditingController();
  @override
  void initState() {
    if (widget.product?.id != null) {
      nameController.text = widget.product!.name!;
      priceController.text = widget.product!.price!.toString();
      stockController.text = widget.product!.stock!.toString();
      descriptionController.text = widget.product!.description!;
    }
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    nameController.dispose();
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        GenericFormProduct(
          nameController: nameController,
          priceController: priceController,
          stockController: stockController,
          descriptionController: descriptionController,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: ButtonLoadingWidget(
            onPressed: () {
              createOrUpdate(context);
            },
            isLoading: Provider.of<ButtonStateProvider>(context).isLoading,
            buttonText:
                widget.titleForm == "Crear producto" ? 'Crear' : 'Actualizar',
          ),
        )
      ],
    );
  }

  createOrUpdate(BuildContext context) async {
    final buttonStateProvider = context.read<ButtonStateProvider>();
    buttonStateProvider.startLoading();
    await Future.delayed(const Duration(milliseconds: 300));
    if (nameController.text.length < 3 ||
        priceController.text.length < 3 ||
        stockController.text.isEmpty ||
        descriptionController.text.length < 3) {
      buttonStateProvider.stopLoading();
      // ignore: use_build_context_synchronously
      return GenericDialog.show(
          context, "Error", "Debe llenar correctamente los campos");
    } else {
      if (widget.titleForm == "Crear producto") {
        // ignore: use_build_context_synchronously
        await Provider.of<FirestoreProvider>(context, listen: false)
            .createProduct(Product(
                description: descriptionController.text,
                id: '',
                name: nameController.text,
                price: int.parse(priceController.text),
                stock: int.parse(stockController.text)))
            .then((value) {
          if (value == null) {
            Navigator.pop(context);
          } else {
            GenericDialog.show(context, "Error", value);
          }
          buttonStateProvider.stopLoading();
        });
      } else {
        // ignore: use_build_context_synchronously
        await Provider.of<FirestoreProvider>(context, listen: false)
            .updateProduct(Product(
                description: descriptionController.text,
                id: widget.product!.id,
                name: nameController.text,
                price: int.parse(priceController.text),
                stock: int.parse(stockController.text)))
            .then((value) {
          if (value == null) {
            Navigator.pop(context);
          } else {
            GenericDialog.show(context, "Error", value);
          }
          buttonStateProvider.stopLoading();
        });
      }
    }
  }
}
