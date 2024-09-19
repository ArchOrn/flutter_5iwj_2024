import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/square.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.white;

  void _changeColor() {
    setState(() => _color = _color == Colors.white ? _color = Colors.black : Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Center(
        child: Square(
          onTap: _changeColor,
        ),
      ),
    );
  }
}
