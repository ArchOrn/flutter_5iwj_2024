import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/widgets/red_circle.dart';
import 'package:flutter_5iwj_2024/home/widgets/red_square.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.orange,
                    padding: const EdgeInsets.all(12),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ...List.generate(22, (index) {
                          return const RedCircle();
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        color: Colors.amber,
                        padding: const EdgeInsets.all(12),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RedCircle(),
                            SizedBox(width: 8),
                            RedCircle(),
                            Spacer(),
                            RedCircle(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const RedSquare(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
