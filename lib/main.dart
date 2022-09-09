import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_silver_bar/core/view_models/home_view_model.dart';
import 'package:flutter_silver_bar/ui/route_generator.dart';
import 'package:flutter_silver_bar/ui/values/routes.dart';
import 'package:flutter_silver_bar/ui/values/styles.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeApp,
        initialRoute: Routes.BAR_ROUTE,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
