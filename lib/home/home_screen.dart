import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/square.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.red;

  void _changeColor() {
    setState(() => _color = _color == Colors.red ? _color = Colors.amber : Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Square(color: _color),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: _changeColor,
        child: const Icon(
          Icons.swap_calls,
          color: Colors.white,
        ),
      ),
    );
  }
}
