import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String brand;
  String? price;
  List<dynamic> size;
  List<dynamic>? images;
  bool? isFeatured;
  String category;
  String? stock;
  String? salePrize;
  String? title;

  ProductModel(
      {this.title,
      required this.brand,
      this.stock,
      this.price,
      this.images,
      required this.category,
      this.isFeatured,
      this.salePrize,
      required this.size});

//Convert model to Json structure for storing data in firebase.

  Map<String, dynamic> toJson() {
    return {
      "Title": title,
      'Brand': brand,
      "Price": price,
      "Size": size,
      "Images": images,
      "isFeatured": isFeatured,
      "Category": category,
      "Stock": stock,
      "Sale Price": salePrize
    };
  }

  // Empty model
  static ProductModel empty() => ProductModel(
      brand: '',
      category: '',
      size: List.empty(),
      images: List.empty(),
      price: '');

// Facrory method to creat UserModel from a firebase document snapshot.
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
        brand: data['Brand'],
        images: data['Images'],
        price: data['Price'],
        title: data['Title'],
        category: data['Category'],
        size: data['Size']);
  }
}
