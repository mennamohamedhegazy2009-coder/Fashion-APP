import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider extends ChangeNotifier {
  // استخدام Map لتخزين المنتج مع الكمية (Quantity) لسهولة الإدارة
  final Map<int, CartItem> _cartItems = {};

  List<CartItem> get items => _cartItems.values.toList();

  // حساب العدد الإجمالي للقطع في السلة
  int get totalItemsCount => _cartItems.length;

  // إضافة منتج للسلة (مع زيادة الكمية إذا كان موجوداً بالفعل)
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

  // تقليل الكمية أو حذف المنتج إذا وصلت لـ 1
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

  // حذف المنتج تماماً من السلة بغض النظر عن كميته
  void deleteProduct(int productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  // حساب المجموع الكلي (السعر × الكمية)
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

// كلاس فرعي لتنظيم البيانات داخل السلة
class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}