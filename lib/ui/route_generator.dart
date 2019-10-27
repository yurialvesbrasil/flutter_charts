import 'package:flutter/material.dart';
import 'package:flutter_silver_bar/ui/screens/bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BarView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Page not found'),
        ),
        body: Center(
          child: Text('Opss, Page not found'),
        ),
      );
    });
  }
}
