class ProductModel {
  String brand;
  String? price;
  List<dynamic> size;
  List<String>? images;
  bool? isFeatured;
  String category;
  String? stock;
 String? salePrize;

  

 ProductModel({
required this.brand,
 this.stock,
 this.price,
 this.images,
required this.category,
this.isFeatured,
this.salePrize,
required this.size
  });

//Convert model to Json structure for storing data in firebase.

  Map<String, dynamic> toJson() {
    return {
      'Brand': brand,
      "Price": price,
      "Size" : size ,
      "Images": images,
      "isFeatured": isFeatured,
      "Category": category,
      "Stock": stock,
       "Sale Price": salePrize
    };
  }

  
}
