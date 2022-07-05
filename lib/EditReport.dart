import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Authentication/LoginRegistrationClass.dart';
import 'Authentication/ReusableWidgets.dart';
import 'SelectorPage.dart';

class EditReport extends StatefulWidget {
  const EditReport({Key? key}) : super(key: key);
  static const routeName = '/editReport';


  @override
  _EditReportState createState() => _EditReportState();
}

class _EditReportState extends State<EditReport> {
  User? user = FirebaseAuth.instance.currentUser;
  LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();
  ReusableWidgets reusableWidgets = ReusableWidgets();

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.redAccent,
        title: const Text("Edit created Report",
          style: TextStyle(color: Colors.white),),
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SelectorPage()),
                result: (route) => false);
          },

        ),
      ),
      backgroundColor: Colors.red.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 40, horizontal: 0.0),
          child:
          Card(
            color: Colors.white70,
            elevation: 0.2,
            shadowColor: Colors.black,
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Form(
                key: loginRegistrationClass.formKey,
                child: Column(

                  children: [
                    loginRegistrationClass.space(),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: TextFormField(
                        controller: loginRegistrationClass.sendersName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Enter your name");
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            loginRegistrationClass.sendersName.text = value!;
                          });
                        },

                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black54),
                        decoration: InputDecoration(
                          label: const Text(
                            'Reporters Name',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                          ),
                          hintText: 'Your name',
                          prefix: Icon(
                            Icons.person,
                            color: loginRegistrationClass.iconColor(),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 5),
                      child: TextFormField(
                        controller: loginRegistrationClass.feedName,
                        onSaved: (value) {
                          setState(() {
                            loginRegistrationClass.feedName.text = value!;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Enter the report name");
                          }
                          return null;
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black54),
                        decoration:  InputDecoration(
                          prefix: Icon(
                            Icons.info_rounded,
                            color: loginRegistrationClass.iconColor(),
                          ),
                          label: const Text(
                            'Report Name',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                          ),
                          hintText: 'Example: Test ',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: TextFormField(
// obscureText: true,
                        controller: loginRegistrationClass.feedNews,
                        onSaved: (value) {
//Do something with the user input.
                          setState(() {
                            loginRegistrationClass.feedNews.text = value!;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black54),
                        decoration: InputDecoration(
                          label: const Text(
                            'Report Details',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                          ),
                          hintText: 'Report Details',
                          prefix: Icon(
                            Icons.person,
                            color: loginRegistrationClass.iconColor(),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: TextFormField(
// obscureText: true,
                        controller: loginRegistrationClass.phoneNumber,
                        onSaved: (value) {
//Do something with the user input.
                          setState(() {
                            loginRegistrationClass.phoneNumber.text = value!;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black54),
                        decoration: InputDecoration(
                          label: const Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                          ),
                          hintText: 'Phone Number',
                          prefix: Icon(
                            Icons.person,
                            color: loginRegistrationClass.iconColor(),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: TextFormField(
// obscureText: true,
                        controller: loginRegistrationClass.imagePicker,
                        onSaved: (value) {
//Do something with the user input.
                          setState(() {
                            loginRegistrationClass.imagePicker.text = value!;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black54),
                        decoration: InputDecoration(
                          label: const Text(
                            'Image',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                          ),
                          hintText: 'Image(Optional)',
                          prefix: Icon(
                            Icons.person,
                            color: loginRegistrationClass.iconColor(),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                    loginRegistrationClass.space(),
                    loginRegistrationClass.space(),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        // foregroundColor:
                        //     MaterialStateProperty.all<Color>(Colors.green),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: const BorderSide(
                                color: Colors.redAccent),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        //Send this information to the database
                        if (loginRegistrationClass.formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          //get the user information
                          _uploadUserData();
                        }
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    loginRegistrationClass.space(),
                    loginRegistrationClass.space()

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///////////////////////////////////////////
  //            fetch user data            //
  //////////////////////////////////////////
  Future<void> _getUserData() async {
    //instantiate the classes
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    await firebaseFirestore
        .collection('createdReport')
    // .document((await FirebaseAuth.instance.currentUser()).uid)
        .doc(user!.uid)
        .get()
        .then(
          (value) {
        setState(()
        {
          loginRegistrationClass.sendersName.text = value.data()!['sendersName'].toString();
          loginRegistrationClass.reportDetails.text = value.data()!['reportDetails'].toString();
          loginRegistrationClass.reportName.text = value.data()!['reportName'].toString();
          loginRegistrationClass.imagePicker.text = value.data()!['feedNews'].toString();
          loginRegistrationClass.phoneNumber.text = value.data()!['phoneNumber'].toString();

        },
        );
      },
    );
  }

  ///////////////////////////////////////////
  //           upload user data           //
  //////////////////////////////////////////
  Future<void> _uploadUserData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      //writing to firebase
      //adding the details to the constructor
      await firebaseFirestore.collection("createdReport").doc(user?.uid).update({

        'imagePicker': loginRegistrationClass.imagePicker.text.trim(),
        'sendersName': loginRegistrationClass.sendersName.text.trim(),
        'reportName': loginRegistrationClass.reportName.text.trim(),
        'reportDetails': loginRegistrationClass.reportDetails.text.trim(),
        'phoneNumber': loginRegistrationClass.phoneNumber.text.trim(),

      }).whenComplete(
            () => Fluttertoast.showToast(
            msg: 'Update Complete',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16),
      ).then((value) =>
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SelectorPage(),
            ),
          ),
      ); //writing to firebase
    } catch (e) {
      Fluttertoast.showToast(
          msg: '$e',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16);
    }
  }
}
