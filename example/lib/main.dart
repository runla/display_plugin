
import 'package:display_plugin_example/page/routers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
typedef TestCallback = void Function(String name, int age);

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homePage,
      // routes: routes,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
