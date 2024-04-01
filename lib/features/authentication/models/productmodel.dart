class ProductModel {
  String brand;
  int price;
  List<dynamic> size;
  List<String> images;
  bool? isFeatured;
  String? catagory;
  int stock;
 int? salePrize;

  

 ProductModel({
required this.brand,
required this.stock,
required this.price,
required this.images,
this.catagory,
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
      "Isfeatured": isFeatured,
      "Category": catagory,
      "Stock": stock,
       "Sale Price": salePrize
    };
  }
}
