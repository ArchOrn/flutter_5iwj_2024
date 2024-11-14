import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  static const String routeName = '/article';
  static navigateTo(BuildContext context, {required String id}) {
    Navigator.of(context).pushNamed(routeName, arguments: id);
  }

  final String id;

  const ArticleScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.lightGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Article screen for id: \'$id\'',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Back',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
