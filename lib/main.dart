import 'package:flutter/material.dart';

void main() {
  runApp(
    const A(),
  );
}

class A extends StatelessWidget {
  const A({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}
