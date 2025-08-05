
class Cart {
  final bool isAddedToCart;
  final int quantity;

  Cart({required this.isAddedToCart, required this.quantity});

  Cart copyWith({required bool isAddedToCart, required int quantity}) {
    return Cart(isAddedToCart: isAddedToCart, quantity: quantity);
  }
}