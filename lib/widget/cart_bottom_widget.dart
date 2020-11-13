import 'package:flutter/material.dart';
import 'package:bloc_add_to_cart/cubit/cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var count = 0;
        var total = 0.0;
        if (state is CartData) {
          count = state.totalItems;
          total = state.totalPrice;
        }

        return count == 0
            ? Container()
            : Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: count.toString(),
                          children: [
                            TextSpan(text: ' '),
                            TextSpan(
                                text: 'Item' + (count > 1 ? 's' : ''),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                )),
                          ],
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'ID',
                          name: 'Rp',
                          decimalDigits: 0,
                        ).format(total * count),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
