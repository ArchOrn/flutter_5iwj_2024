import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/widgets/red_square.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            RedSquare(),
            RedSquare(),
            RedSquare(),
          ],
        ),
      ),
    );
  }
}
