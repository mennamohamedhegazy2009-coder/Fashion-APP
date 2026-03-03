import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, CartItem> _cartItems = {};

  List<CartItem> get items => _cartItems.values.toList();

  int get totalItemsCount => _cartItems.length;

  void add(Product product) {
    if (_cartItems.containsKey(product.id)) {
      _cartItems.update(
        product.id,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _cartItems[product.id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void remove(int productId) {
    if (!_cartItems.containsKey(productId)) return;

    if (_cartItems[productId]!.quantity > 1) {
      _cartItems.update(
        productId,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity - 1,
        ),
      );
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void deleteProduct(int productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _cartItems.clear();
    notifyListeners();
  }
}

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}
