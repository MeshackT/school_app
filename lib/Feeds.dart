import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);
  static const routeName = '/Feeds';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.white,
              elevation: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("data"),
              ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
