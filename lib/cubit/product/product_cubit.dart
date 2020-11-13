import 'package:bloc/bloc.dart';
import 'package:bloc_add_to_cart/model/product.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  List<Product> lists;

  void loads() async {
    await Future.delayed(Duration(seconds: 2));
    lists = [
      Product(id: 1, title: 'Product 1', price: 50000.0, qyt: 0),
      Product(id: 2, title: 'Product 2', price: 38990.0, qyt: 0),
      Product(id: 3, title: 'Product 3', price: 23000.0, qyt: 0),
      Product(id: 4, title: 'Product 4', price: 85900.0, qyt: 0),
      Product(id: 5, title: 'Product 5', price: 39900.0, qyt: 0),
      Product(id: 6, title: 'Product 6', price: 40000.0, qyt: 0),
      Product(id: 7, title: 'Product 7', price: 50000.0, qyt: 0),
      Product(id: 8, title: 'Product 8', price: 43000.0, qyt: 0),
    ];
    emit(ProductList(lists));
  }

  void buy(int index, int id) {
    lists[index].qyt += 1;
    emit(ProductBuy(lists[index]));
    emit(ProductList(lists));
  }

  void cancel(int index, int id) {
    lists[index].qyt -= 1;
    emit(ProductBuy(lists[index]));
    emit(ProductList(lists));
  }
}
