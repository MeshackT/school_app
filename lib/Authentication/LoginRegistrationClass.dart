import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:school_app/Authentication/ReusableWidgets.dart';
import 'package:school_app/SelectorPage.dart';

import '../LoginPage.dart';

class LoginRegistrationClass {


  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
ReusableWidgets reusableWidgets = ReusableWidgets();

  TextEditingController searchController = TextEditingController();
  //senders name 1
  final TextEditingController sendersName = TextEditingController();
  //Topic name 2
  final TextEditingController feedName = TextEditingController();
  //Topic details 3
  final TextEditingController feedNews = TextEditingController();
  //Phone Number 4
  final TextEditingController phoneNumber = TextEditingController();
  //Topic name 2
  final TextEditingController reportName = TextEditingController();
  //FeedCode
  final TextEditingController feedCode = TextEditingController();

  //Details of topic 3
  final TextEditingController reportDetails = TextEditingController();
  final TextEditingController grade = TextEditingController();
  final TextEditingController subjectType = TextEditingController();

  final TextEditingController imagePicker = TextEditingController();





  String formattedDate(timeStamp){
    var dateFromTimeStamp = DateTime.fromMillisecondsSinceEpoch(
        timeStamp.seconds * 1000
    );
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }
  String formattedTime(){
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(now);
    print(formattedTime);
    return formattedTime;
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut()
          .then((value) =>
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage(),),),);
    } on FirebaseAuthException catch (e) {

        log.i(e.code);

    }
    return;
  }

  ///////////////////////////
  ///   Delete account   ////
  //////////////////////////
  Future<User?> deleteAccount() async{
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        log.i('The user must re-authenticate before this operation can be executed.');
      }
    }
    return null;
  }

  //////////////////////////////////////////
//     put data in the database         //
// ///////////////////////////////////////

  Future<void> addReportRequest(BuildContext context) {
    final CollectionReference createAReport =
    FirebaseFirestore.instance.collection('createdReport');
    User? user = FirebaseAuth.instance.currentUser;

    //date
    Timestamp timeStamp = Timestamp.now();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds *1000);
    //time
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(now);
    // Call the user's CollectionReference to add a new user
    // get item FromLocalStorage();
    log.i(user);
    return createAReport
        .add({
      'uid': user!.uid,
      'date': dateTime,
      'time': formattedTime,
      'imagePicker': imagePicker.text.trim(),
      'sendersName': sendersName.text.trim(),
      'reportName': reportName.text.trim(),
      'reportDetails': reportDetails.text.trim(),
      'phoneNumber': phoneNumber.text.trim(),
      'owner': user.uid,
    })
        .then(
          (value) =>

          Fluttertoast.showToast(msg: "Successfully created")
              .whenComplete(() => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SelectorPage(),
            ),
          )
              .catchError(
                (error) =>
                Fluttertoast.showToast(msg: "failed to send details $error"),
          ),
          ),
    );
  }

  //////////////////////////////////////////
//     put data in the database         //
// ///////////////////////////////////////


  Future<void> addFeedRequest(BuildContext context) {
    final CollectionReference createAFeed =
    FirebaseFirestore.instance.collection('createdFeeds');
    User? user = FirebaseAuth.instance.currentUser;

    //date
    Timestamp timeStamp = Timestamp.now();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds *1000);
    //time
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(now);
    // Call the user's CollectionReference to add a new user
    // get item FromLocalStorage();
    log.i(user);
    return createAFeed
        .add({
          'uid': user!.uid,
          'date': dateTime,
          'time': formattedTime,
          'owner': user.uid,
          'feedName': feedName.text.trim(),
          'feedNews': feedNews.text.trim(),
          'grade': grade.text.trim(),
          'sendersName': sendersName.text.trim(),
          'subjectType': subjectType.text.trim(),
        })
        .then(
          (value) =>

              Fluttertoast.showToast(msg: "Successfully created")
          .whenComplete(() => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SelectorPage(),
            ),
    )
        .catchError(
          (error) =>
          Fluttertoast.showToast(msg: "failed to send details $error"),
             ),
          ),
    );
  }

////////////////////////////
///       space        /////
////////////////////////////
  SizedBox space() {
    return const SizedBox(
      height: 3.0,
    );
  }
  ///////////////////////////
  ///       Text Color   ////
  ////////////////////////////
  TextStyle textStyle(){
    return  const TextStyle(color: Colors.black38, fontWeight: FontWeight.bold);
  }
  TextStyle textStyle1(){
    return TextStyle(color: Colors.red.shade200, fontWeight: FontWeight.bold);
  }

  TextStyle textStyle2(){
    return const TextStyle(fontSize: 14.0,color: Colors.black38, fontWeight: FontWeight.bold);
  }
  TextStyle textStyle3(){
    return const TextStyle(fontSize: 14.0,color: Colors.black12);
  }
  TextStyle textStyle4(){
    return const TextStyle(
    color: Colors.black38
    );
  }
  ///////////////////////////
  ///       icon Color   ////
  ////////////////////////////
  Color iconColor(){
    return Colors.black54;
  }
  ///////////////////////////
  ///       log          ////
  ////////////////////////////
  Logger log = Logger(

    printer: PrettyPrinter(
        colors: true
    ),
  );



}




