import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/home/widgets/red_square.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('First name $index Last name $index'),
              subtitle: Text('$index, rue du Faubourg St Antoine'),
              leading: const Icon(
                Icons.person,
                color: Color(0xff959595),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: 100000,
        ),
      ),
    );
  }
}
