import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/cart/blocs/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static navigateTo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartScreen()));
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: Column(
            children: [
              ...state.lines.map((e) {
                return Dismissible(
                  key: Key(e.product.id.toString()),
                  onDismissed: (direction) {
                    context.read<CartBloc>().add(CartLineRemoved(productId: e.product.id));
                  },
                  child: ListTile(
                    title: Text(e.product.title),
                    leading: Image.network(e.product.imageUrl),
                    trailing: Text('x${e.quantity}'),
                  ),
                );
              }),
            ],
          ));
        },
      ),
    );
  }
}
