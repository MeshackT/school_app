import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);
  static const routeName = '/Reports';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body:  SizedBox(
        child:  Text('Reports'),
      ),
    );
  }
}
