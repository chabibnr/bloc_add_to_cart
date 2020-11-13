import 'package:bloc_add_to_cart/cubit/cart/cart_cubit.dart';
import 'package:bloc_add_to_cart/widget/button_buy_widget.dart';
import 'package:bloc_add_to_cart/widget/cart_bottom_widget.dart';
import 'package:bloc_add_to_cart/widget/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_add_to_cart/cubit/product/product_cubit.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          CartWidget(),
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductCubit()..loads(),
        child: BlocListener<ProductCubit, ProductState>(
          listener: (_, state) {
            if (state is ProductBuy) {
              BlocProvider.of<CartCubit>(context).addToCart(state.product);
            }
          },
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (_, state) {
              if (state is ProductList) {
                return ListView.separated(
                  itemBuilder: (_, index) {
                    var row = state.products[index];
                    return ListTile(
                      title: Text(row.title),
                      subtitle: Text(
                        NumberFormat.currency(
                          locale: 'ID',
                          name: 'Rp',
                          decimalDigits: 0,
                        ).format(row.price),
                      ),
                      trailing: SizedBox(
                        width: row.qyt == 0 ? 48 : 120,
                        child: ButtonBuyWidget(
                          index: index,
                          product: row,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Divider();
                  },
                  itemCount: state.products.length,
                );
              }

              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: CartBottomWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
