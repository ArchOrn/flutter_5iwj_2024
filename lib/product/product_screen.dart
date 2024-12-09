import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/product/blocs/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static void navigateTo(BuildContext context, {required int id}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProductScreen(id: id);
    }));
  }

  final int id;

  const ProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(ProductLoaded(id: id)),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.product?.title ?? ''),
            ),
            backgroundColor: Colors.white,
            body: Builder(builder: (context) {
              if (state.status == ProductStatus.loading || state.status == ProductStatus.initial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.status == ProductStatus.error) {
                return Center(
                  child: Text(state.errorMessage ?? 'An error occurred'),
                );
              }

              final product = state.product!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      product.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        ' ${product.price.toStringAsFixed(2)} €',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          ...List.generate(5, (i) {
                            final rating = product.rating.toInt();
                            return Icon(
                              Icons.star,
                              color: i <= rating ? Colors.blue : Colors.grey,
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
