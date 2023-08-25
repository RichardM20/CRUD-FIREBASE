class Product {
  final String? id;
  final String? name;
  final String? description;
  final int? stock;
  final int? price;

  Product({
    this.id,
    this.name,
    this.description,
    this.stock,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      stock: json['stock'] ?? 0,
      price: json['price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'stock': stock,
      'price': price,
    };
  }
}
