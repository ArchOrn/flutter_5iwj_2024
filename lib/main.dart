import 'package:flutter/material.dart';

void main() {
  runApp(
    const BlueScreen(),
  );
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
