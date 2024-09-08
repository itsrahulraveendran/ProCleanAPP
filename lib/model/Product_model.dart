class ProductModel {
  final String id;
  final String title;
  final int price;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
  factory ProductModel.fromFirestore(Map<String, dynamic> jason, String id) {
    return ProductModel(
        id: id,
        title: jason['title'],
        price: jason['price'],
        image: jason['image']
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'title':title,
      'price':price,
      'image':image,
    };
  }
}
