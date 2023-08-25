import 'package:crud_firebase/presentation/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class GenericFormProduct extends StatelessWidget {
  const GenericFormProduct({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.stockController,
    required this.descriptionController,
  });
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController stockController;
  final TextEditingController descriptionController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          InputWidget(
            controller: nameController,
            hintText: 'Nombre del producto',
          ),
          const SizedBox(height: 20),
          InputWidget(
            controller: descriptionController,
            hintText: 'Descripcion',
          ),
          const SizedBox(height: 20),
          InputWidget(
            typeKeyboard: TextInputType.number,
            controller: priceController,
            hintText: 'Precio',
          ),
          const SizedBox(height: 20),
          InputWidget(
            typeKeyboard: TextInputType.number,
            controller: stockController,
            hintText: 'Cantidad',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
