import 'package:bloc_add_to_cart/cubit/product/product_cubit.dart';
import 'package:bloc_add_to_cart/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonBuyWidget extends StatelessWidget {
  final int index;
  final Product product;

  ButtonBuyWidget({this.index, this.product});

  @override
  Widget build(BuildContext context) {
    return product.qyt == 0
        ? IconButton(
            color: Colors.green,
            padding: EdgeInsets.zero,
            iconSize: 20,
            icon: Icon(Icons.add_circle),
            onPressed: product.qyt >= 10
                ? null
                : () {
                    BlocProvider.of<ProductCubit>(context).buy(index, product.id);
                  },
          )
        : TextField(
            readOnly: true,
            enableInteractiveSelection: false,
            textAlign: TextAlign.center,
            controller: TextEditingController.fromValue(TextEditingValue(text: product.qyt.toString())),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              prefixIcon: IconButton(
                color: Colors.red,
                padding: EdgeInsets.zero,
                iconSize: 20,
                icon: Icon(Icons.remove_circle),
                onPressed: product.qyt == 0
                    ? null
                    : () {
                        BlocProvider.of<ProductCubit>(context).cancel(index, product.id);
                      },
              ),
              suffixIcon: IconButton(
                color: Colors.green,
                padding: EdgeInsets.zero,
                iconSize: 20,
                icon: Icon(Icons.add_circle),
                onPressed: product.qyt >= 10
                    ? null
                    : () {
                        BlocProvider.of<ProductCubit>(context).buy(index, product.id);
                      },
              ),
            ),
          );
  }
}
