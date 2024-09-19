import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AppData(
        child: Home(),
      ),
      theme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppData.of(context).myColor,
      child: Center(
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}

class AppData extends InheritedWidget {
  static AppData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppData>()!;
  }

  final Color myColor = const Color(0xffd50f34);

  const AppData({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
