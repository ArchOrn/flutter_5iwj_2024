import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final VoidCallback? onTap;

  const Square({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}
