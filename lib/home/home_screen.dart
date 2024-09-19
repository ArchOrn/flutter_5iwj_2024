import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/widgets/red_square.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.amber,
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ), // 1
              const RedSquare(), // 2
              const RedSquare(), // 3
              const RedSquare(), // 4 <--
            ],
          ),
        ),
      ),
    );
  }
}
