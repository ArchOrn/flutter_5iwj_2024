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
        switch (routeSettings.name) {
          case ArticleScreen.routeName:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return ArticleScreen(id: routeSettings.arguments as String);
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final opacityTween = CurveTween(curve: Curves.easeInOut);

                animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
                final offsetAnimation = animation.drive(tween);
                final opacityAnimation = animation.drive(opacityTween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: FadeTransition(
                    opacity: opacityAnimation,
                    child: child,
                  ),
                );
              },
            );
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
