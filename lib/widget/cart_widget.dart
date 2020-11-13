import 'package:flutter/material.dart';
import 'package:bloc_add_to_cart/cubit/cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var count = 0;
        if (state is CartData) {
          count = state.totalItems;
        }

        return Stack(
          children: [
            Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
            ),
            Positioned(
              right: 2,
              top: 5,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
