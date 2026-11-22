import 'products_model.dart';

class CartModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final dynamic price;
  final dynamic rating;
  final int quantity;
  final bool isExist;
  String time;
  final ProductsModel productsModel;

  CartModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.isExist,
    required this.time,
    required this.productsModel,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['description'] = description;
    data['rating'] = rating;
    data['image'] = image;
    data['price'] = price;
    data['quantity'] = quantity;
    data['isExist'] = isExist;
    data['time'] = time;
    data['productsModel'] = productsModel.toJson();

    return data;
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? '',
      description: json['description'] ?? '',
      rating: json['rating'] ?? '',
      quantity: json['quantity'] ?? '',
      isExist: json['isExist'] ?? '',
      time: json['time'] ?? '',
      productsModel: ProductsModel.fromJson(json['productsModel']),
    );
  }
}
