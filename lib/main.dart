import 'package:flutter/material.dart';
import 'package:school_app/Feeds.dart';
import 'package:school_app/LogInPage.dart';
import 'package:school_app/Reports.dart';
import 'package:school_app/Settings.dart';
import 'package:school_app/SignUpPage.dart';
import 'package:school_app/StartUpPage.dart';

import 'SelectorPage.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName:(context) => const LogIn(),
  SignupPage.routeName: (context) => const SignupPage(),
  LogIn.routeName: (context) => const LogIn(),
  Settings.routeName: (context) => const Settings(),
  Feeds.routeName: (context) => const Feeds(),
  Reports.routeName: (context) => const Reports(),
  MyApp.routeName: (context) => const MyApp(),


};
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const routeName = '/MainPage';

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School App',
      home: SelectorPage(),

    );
  }
}
