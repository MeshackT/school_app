import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:school_app/Authentication/LoginRegistrationClass.dart';
import 'package:school_app/CreateAFeed.dart';
import 'package:school_app/LoginPage.dart';
import 'package:school_app/Profile.dart';
import 'package:school_app/Reports.dart';

import 'CreateAReport.dart';
import 'Feeds.dart';
import 'More.dart';

class SelectorPage extends StatefulWidget {
  const SelectorPage({Key? key}) : super(key: key);
  static const routeName = '/SelectorPage';


  @override
  State<SelectorPage> createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  final LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  final List<Widget> _tabs = const [
    /*LogIn(),*/
    Feeds(),
    Reports(),
    More()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: loginRegistrationClass.scaffoldKey,
      //drawer: const Drawer(),
      appBar: AppBar(

        backgroundColor: Colors.redAccent,
        title: const Text("Notifier"),
        centerTitle: true,
        elevation: 2,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.search)),
          Theme(
            data: Theme.of(context).copyWith(
              textTheme: const TextTheme().apply(bodyColor: Colors.white),
              dividerColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            child: PopupMenuButton<int>(
              color: Colors.redAccent,
              elevation: 2,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Create A Feed",
                        style: TextStyle(color: Colors.white),

                      ),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Create A Report",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(color: Colors.white),

                      ),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 3,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Log Out",
                        style: TextStyle(color: Colors.white),

                      ),
                    ],
                  ),
                ),
              ],
              onSelected: (item) => selectedItem( item),
            ),
          ),
        ],

      ),

      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          _tabs[_currentIndex],
          //const Drawer(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.grey.shade200,
        child:  Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
          child: GNav(
            gap: 5,
            selectedIndex: _currentIndex,

            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade100,
            tabs: const [
                /*GButton(
                    icon: Icons.person_pin_circle,
                    text:"LogIn",
                ),*/
                GButton(
                  icon: Icons.new_releases_sharp,
                  text:"Feeds",
                ),
                GButton(
                    icon: Icons.report,
                    text: "Reports",
                ),
                GButton(
                  icon: Icons.more_horiz_sharp,
                  text: "More",
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
  Future<void> selectedItem(item) async {

    switch (item) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CreateAFeed()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CreateAReport()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyProfile()));

        break;
      case 3:
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            duration:  const Duration(seconds: 4), content:
          Row(
            children: const <Widget>[
              CircularProgressIndicator(),
              Text("  Signing in...")
            ],
          ),
          ),
        );
        loginRegistrationClass.logout()
            .whenComplete(() =>
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()))
        );
        break;
    }
  }
}
