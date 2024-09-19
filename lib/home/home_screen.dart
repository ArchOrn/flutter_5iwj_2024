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
          child:  const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: RedSquare(),
              ),
              RedSquare(),
              SizedBox(width: 10),
              RedSquare(),
            ],
          ),
        ),
      ),
    );
  }
}
