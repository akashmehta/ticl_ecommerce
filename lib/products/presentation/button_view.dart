
import 'package:flutter/material.dart';
import '../../cart/domain/cart_data.dart';

class ButtonView extends StatefulWidget {
  final Cart cart;
  final Function(Cart) onUpdateCart;
  const ButtonView({super.key, required this.cart, required this.onUpdateCart});

  @override
  State<ButtonView> createState() => _ButtonState();
}

class _ButtonState extends State<ButtonView> {

  late Cart _cart;
  late ValueNotifier<Cart> _cartNotifier;

  @override
  void initState() {
    super.initState();
    _cart = widget.cart;
    _cartNotifier = ValueNotifier(_cart);
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: _cartNotifier, builder: (context, item, _) {
      return item.isAddedToCart ? Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              if ((item.quantity ?? 0) > 1) {
                _cartNotifier.value = item.copyWith(
                  isAddedToCart: true,
                  quantity: (item.quantity ?? 0) - 1,
                );
              } else {
                _cartNotifier.value = item.copyWith(
                  isAddedToCart: false,
                  quantity: 0,
                );
              }
              widget.onUpdateCart(_cartNotifier.value);
            },
          ),
          Text('${item.quantity}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _cartNotifier.value = item.copyWith(
                isAddedToCart: true,
                quantity: (item.quantity ?? 0) + 1,
              );
              widget.onUpdateCart(_cartNotifier.value);
            },
          ),
        ],
      ) :  ElevatedButton(
        onPressed: () {
          _cartNotifier.value = _cart.copyWith(
            isAddedToCart: true,
            quantity: 1,
          );
          widget.onUpdateCart(_cartNotifier.value);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          'Add To Cart',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    });
  }

  @override
  void dispose() {
    _cartNotifier.dispose();
    super.dispose();
  }
}