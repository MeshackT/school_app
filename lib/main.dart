import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_app/Authentication/EditFeeds.dart';
import 'package:school_app/Authentication/LoginRegistrationClass.dart';
import 'package:school_app/CreateAFeed.dart';
import 'package:school_app/Feeds.dart';
import 'package:school_app/LoginPage.dart';
import 'package:school_app/More.dart';
import 'package:school_app/Profile.dart';
import 'package:school_app/Reports.dart';
import 'package:school_app/ResetPassword.dart';
import 'package:school_app/SignUpPage.dart';
import 'CreateAReport.dart';
import 'package:firebase_core/firebase_core.dart';
import 'EditReport.dart';
import 'SelectorPage.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName:(context) => const LoginPage(),
  SignupPage.routeName: (context) => const SignupPage(),
  More.routeName: (context) => const More(),
  Feeds.routeName: (context) => const Feeds(),
  Reports.routeName: (context) => const Reports(),
  CreateAFeed.routeName: (context) => const CreateAFeed(),
  CreateAReport.routeName: (context) => const CreateAReport(),
  MyProfile.routeName: (context) => const MyProfile(),
  ResetPassword.routeName: (context) => const ResetPassword(),
  EditFeeds.routeName: (context) => const EditFeeds(),
  EditReport.routeName: (context) => const EditReport()

};

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = FirebaseAuth.instance.currentUser;
  final LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();


  @override
  Widget build(BuildContext context) {
    // Changes made=>>> I added the state connection checker which is still under review
    return FutureBuilder(
        builder: (ctx, snapshot) {
          // Checking if future is resolved
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            User? user = snapshot.data as User?;
            if (user != null) {
              loginRegistrationClass.log.i(user.uid);
              return const SelectorPage();

              // if we got our data
            }
            loginRegistrationClass.log.i("No user");
            return const Text(
              ""
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'School App',
            home: LoginPage(),
          );
        });
  }
}
