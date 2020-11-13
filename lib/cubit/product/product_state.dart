part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductBuy extends ProductState {
  final Product product;
  ProductBuy(this.product);
}

class ProductList extends ProductState {
  final List<Product> products;

  ProductList(this.products);
}
