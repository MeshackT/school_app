
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          return Column(
            children: [
             const  CircularProgressIndicator(
                color: Colors.redAccent,
              ),
              loginRegistrationClass.space(),
              const Text("Something went wrong")
            ],
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Column(
            children: [
              const  CircularProgressIndicator(
                color: Colors.redAccent,
              ),
              loginRegistrationClass.space(),
              const Text("Document does not exits")
            ],
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
              ),
              backgroundColor: Colors.white,
              body: SizedBox(
                  height: 250,
                  child: Column(
                    children: [
                      const Text("My Information",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15.0,),
                      Row(
                        children: [
                          Column(
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
                          Column(
                            children: [
                              Text("${data['name']}"),
                              const SizedBox(height: 10,),
                              Text("${data['email']}"),
                              const SizedBox(height: 10,),
                              Text("${data['subjectTeaching']}"),
                              const SizedBox(height: 10,),
                              Text("${data['grade']}"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      TextButton(
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                                  (route) => false);
                        },
                        child: const Text("Sign Out",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextButton(
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
                                      loginRegistrationClass.logout()
                                          .then((value) =>
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => const LoginPage(),
                                            ),

                                          ),);
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
                      )

                    ],
                  ),
                ),
            );
            /*Text("Full Name: ${data['full_name']} ${data['last_name']}")*/
        }

        return Text("Loading...");
      },
    );
  }

    /**/
  }


