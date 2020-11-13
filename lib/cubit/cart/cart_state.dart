part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartAdd extends CartState {
  final int count;

  CartAdd(this.count);
}

class CartData extends CartState {
  final List<Product> lists;
  final int totalItems;
  final double totalPrice;

  CartData({
    this.lists,
    this.totalItems,
    this.totalPrice,
  });
}
