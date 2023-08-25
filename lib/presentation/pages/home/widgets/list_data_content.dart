import 'package:crud_firebase/domain/models/product_model.dart';
import 'package:crud_firebase/presentation/providers/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListDataContent extends StatelessWidget {
  const ListDataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: const Text('Product List'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: Provider.of<FirestoreProvider>(context).listenProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available.'));
          } else {
            final productList = snapshot.data!;
            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(product.name!),
                    subtitle: Text(product.description!),
                    onTap: () => Navigator.pushNamed(context, '/edit',
                        arguments: product),
                    onLongPress: () {
                      Provider.of<FirestoreProvider>(context, listen: false)
                          .deleteProduct(product.id!);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/create',
          );
        },
      ),
    );
  }
}
