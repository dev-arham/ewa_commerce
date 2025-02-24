class CartItemModel {
  String productId;
  String title;
  int price;
  String? image;
  int quantity;
  String? brandName;

  CartItemModel({
    required this.productId,
    this.title = '',
    this.price = 0,
    this.image,
    required this.quantity,
    this.brandName,
  });

  static CartItemModel empty() {
    return CartItemModel(
      productId: '',
      quantity: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'brandName': brandName,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      brandName: json['brandName'],
    );
  }
}
