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
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
                SizedBox(width: 10),
                RedSquare(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
