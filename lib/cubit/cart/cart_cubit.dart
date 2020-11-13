import 'package:bloc/bloc.dart';
import 'package:bloc_add_to_cart/model/product.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  Map<int, Product> productLists = Map();

  CartCubit() : super(CartInitial());

  addToCart(Product product) {
    if (product.qyt == 0) {
      productLists.remove(product.id);
    } else {
      productLists[product.id] = product;
    }
    var totalItem = 0;
    var totalPrice = 0.0;

    var list = productLists.entries.map((e) {
      totalItem += e.value.qyt;
      totalPrice += e.value.price;
      return e.value;
    }).toList();
    emit(CartData(
      lists: list,
      totalItems: totalItem,
      totalPrice: totalPrice,
    ));
  }
}
