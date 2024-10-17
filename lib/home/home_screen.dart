import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/widgets/red_square.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(100, (index) {
                return const Column(
                  children: [
                    RedSquare(),
                    SizedBox(height: 10),
                  ],
                );
              }),
              const RedSquare(),
            ],
          ),
        ),
      ),
    );
  }
}
