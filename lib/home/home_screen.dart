import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/blocs/home_bloc.dart';
import 'package:flutter_5iwj_2024/product/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeProductsLoaded()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }

            if (state is HomeSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(product.description),
                    leading: Image.network(product.imageUrl),
                    onTap: () => ProductScreen.navigateTo(context, id: product.id),
                  );
                },
                itemCount: state.products.length,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
