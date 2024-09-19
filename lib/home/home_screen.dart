import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/square.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Square(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(
          Icons.swap_calls,
          color: Colors.white,
        ),
      ),
    );
  }
}
