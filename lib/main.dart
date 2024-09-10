import 'package:flutter/material.dart';

void main() {
  runApp(
    const A(color: Colors.green),
  );
}

class A extends StatelessWidget {
  final Color color;

  const A({super.key, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: color,
      ),
    );
  }
}
