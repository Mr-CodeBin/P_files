class CartItemModel {
  final String brandName;
  final String name;
  final int qty;
  final double price;
  final List<int>? sizes;
  final String imgURL;
  const CartItemModel(
      {required this.brandName,
      required this.name,
      required this.qty,
      required this.price,
      required this.sizes,
      required this.imgURL});
}
