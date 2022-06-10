import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:school_app/Reports.dart';

import 'Feeds.dart';
import 'Settings.dart';
import 'StartUpPage.dart';

class SelectorPage extends StatefulWidget {
  const SelectorPage({Key? key}) : super(key: key);
  static const routeName = '/SelectorPage';


  @override
  State<SelectorPage> createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {

  int _currentIndex = 1;
  final List<Widget> _tabs = const [
    LogIn(),
    Feeds(),
    Reports(),
    Settings()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: const Text(""),
        centerTitle: true,
        elevation: 0.0,
        actions: const [],

      ),

      backgroundColor: Colors.white,
      body: _tabs[_currentIndex],
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.grey.shade400,
        child:  Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            gap: 8,
            selectedIndex: _currentIndex,

            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade50,
            tabs: const [
                GButton(
                    icon: Icons.person_pin_circle,
                    text:"LogIn",
                ),
                GButton(
                  icon: Icons.new_releases_sharp,
                  text:"Feeds",
                ),
                GButton(
                    icon: Icons.report,
                    text: "Reports",
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Settings",
                ),
              ],
              onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
