import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/cart/blocs/cart_bloc.dart';
import 'package:flutter_5iwj_2024/cart/cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'cart_floating_button',
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Stack(
            children: [
              FloatingActionButton(
                onPressed: () => CartScreen.navigateTo(context),
                heroTag: null,
                shape: const CircleBorder(),
                child: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      state.count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
