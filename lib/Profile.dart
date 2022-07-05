import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_app/Authentication/ReusableWidgets.dart';
import 'package:school_app/EditProfile.dart';
import 'package:school_app/LoginPage.dart';
import 'package:school_app/SelectorPage.dart';

import 'Authentication/LoginRegistrationClass.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();
final ReusableWidgets reusableWidgets = ReusableWidgets();
  String name= "";
  String email= "";
  String grade= "";
  String subjectTeaching= "";

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user?.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.width/2,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const  CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
                loginRegistrationClass.space(),
                const Text("Something went wrong, check your connection", style: TextStyle(fontSize: 14.0),)
              ],
            ),
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.width/2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const  CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
                loginRegistrationClass.space(),
                const Text("Document does not exits", style: TextStyle(fontSize: 14.0),)
              ],
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                leading: IconButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SelectorPage(),
                      ),
                    );
                  },
                  color: Colors.white,
                  icon: const Icon(
                      Icons.arrow_back_ios
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                            ),
                        );
                      },
                      icon: const Icon(Icons.edit)),
                ],
              ),
              backgroundColor: Colors.red.shade50,
              body: Center(

                child: Container(
                  color: Colors.red.shade50,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.red.shade100,
                          child: const Center(
                            child:  Text("My Information",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Name",),
                                    SizedBox(height: 10,),
                                    Text("Email"),
                                    SizedBox(height: 10,),
                                    Text("Grade"),
                                    SizedBox(height: 10,),
                                    Text("Subject Type"),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("${data['name']}"),
                                    const SizedBox(height: 10,),
                                    Text("${data['email']}"),
                                    const SizedBox(height: 10,),
                                    Text("${data['grade']}"),
                                    const SizedBox(height: 10,),
                                    Text("${data['subjectTeaching']}"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: (){
                              loginRegistrationClass.logout(context).then((value) =>
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginPage()),
                                          (route) => false));

                            },
                            child: const Text("Sign Out",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(

                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Delete"),
                                    elevation: 2,
                                    backgroundColor: Colors.white,
                                    content: const Text("Do you want to delete your account permanently?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("Yes"),
                                        onPressed: () {
                                          loginRegistrationClass.deleteAccount()
                                              .then((value) =>
                                              loginRegistrationClass.log.i("deleted: " + user!.uid),
                                              ).whenComplete(() =>
                                              Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) => const LoginPage(),
                                                ),

                                              ),
                                          );
                                        },
                                      ),
                                      TextButton(
                                        child: const Text("No"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text("Delete account permanently",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
              ),
            );
            /*Text("Full Name: ${data['full_name']} ${data['last_name']}")*/
        }

        return Container(
          color: Colors.red.shade50,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reusableWidgets.circleProgress(),
               loginRegistrationClass.space(),

            ],
          ),
        );
      },
    );
  }

    /**/
  }


