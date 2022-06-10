import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  static const routeName = '/Settings';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.grey,
        body:  SizedBox(
        child:  Text('Settings'),
      ),
    );
  }
}
