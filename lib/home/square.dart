import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final Color color;

  const Square({super.key, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: color,
    );
  }
}
