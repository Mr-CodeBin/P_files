class CartItemModel{
  final String brandName;
  final String name;
  final int qty;
  final double price;
  final int size1;
  final int size2;
  final String imgURL;
  const CartItemModel({
    required this.brandName,
    required this.name,
    required this.qty,
    required this.price,
    required this.size1,
    required this.size2,
    required this.imgURL
  });
}