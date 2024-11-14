import 'package:flutter/material.dart';
import 'package:flutter_5iwj_2024/article/article_screen.dart';
import 'package:flutter_5iwj_2024/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
      },
      onGenerateRoute: (routeSettings) {
        switch(routeSettings.name) {
          case ArticleScreen.routeName:
            return MaterialPageRoute(builder: (context) {
              return ArticleScreen(id: routeSettings.arguments as String);
            });
        }

        return null;
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
    );
  }
}
