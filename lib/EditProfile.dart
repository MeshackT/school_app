import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_app/Profile.dart';

import 'Authentication/LoginRegistrationClass.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  static const routeName = '/EditProfile';


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();

  bool validationAndSave() {
    final form = loginRegistrationClass.formKey.currentState;
    if (form!.validate()) {
      form.save();
      return false;
    }
    return true;
  }


  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController subjectTeaching = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: loginRegistrationClass.scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          color: loginRegistrationClass.iconColor(),
          onPressed: (){
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const MyProfile(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: loginRegistrationClass.iconColor(),),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.red.shade50,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Column(
                      children: const [
                        Text ("Update your information", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Form(
                        key: loginRegistrationClass.formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Name",
                                  style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                TextFormField(
                                  controller: name,
                                  obscureText: false,
                                  onSaved: (value){
                                    setState(() {
                                      name.text = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return ("Enter your name");
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade400)
                                    ),
                                  ),
                                ),
                                const Text("Email",
                                  style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                TextFormField(
                                  controller: email,
                                  obscureText: false,
                                  onSaved: (value){
                                    setState(() {
                                      email.text = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return ("Enter a valid email");
                                    }
                                    if (!value.contains('@')) {
                                      return ("Please Enter a valid valid email");
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade400)
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                const Text("Subject Teaching",
                                  style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                TextFormField(
                                  controller: subjectTeaching,
                                  obscureText: true,
                                  onSaved: (value){
                                    setState(() {
                                      subjectTeaching.text = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade400)
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                const Text("Grade",
                                  style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                TextFormField(
                                  controller: loginRegistrationClass.grade,
                                  obscureText: false,
                                  onSaved: (value){
                                    setState(() {
                                      loginRegistrationClass.grade.text = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade400)
                                    ),
                                  ),
                                ),
                              ],)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3,left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:60,
                          onPressed: (){
                            if (loginRegistrationClass.formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              //get the use
                              // r information
                              loginRegistrationClass.scaffoldKey.currentState!.showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  duration:  const Duration(seconds: 4), content:
                                Row(
                                  children: const <Widget>[
                                    CircularProgressIndicator(),
                                    Text("  Updating information...")
                                  ],
                                ),
                                ),
                              );
                              _uploadUserData().whenComplete(() =>
                                  Fluttertoast.showToast(msg: "Update complete")
                                      .then((value) =>
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => const MyProfile(),
                                         ),
                                      ),
                                  ),
                              );

                            }
                          },
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)
                          ),
                          child: const Text("Update",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white
                            ),),

                        ),
                      ),
                    ),
                  ],

                ),
              ],
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
        .collection('users')
    // .document((await FirebaseAuth.instance.currentUser()).uid)
        .doc(user!.uid)
        .get()
        .then(
          (value) {
        setState(
              () {
            const Center(
              child: CircularProgressIndicator(),
            );
            loginRegistrationClass.grade.text = value.data()!['grade'].toString();
            email.text = value.data()!['email'].toString();
            name.text = value.data()!['name'].toString();
            phoneNumber.text = value.data()!['phoneNumber'].toString();
            subjectTeaching.text = value.data()!['subjectTeaching'].toString();

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
      await firebaseFirestore.collection("users").doc(user?.uid).update({
        'name': name.text,
        'email': email.text,
        'phoneNumber': phoneNumber.text,
        'grade': loginRegistrationClass.grade.text,
        'subjectTeaching': subjectTeaching.text,
      }).whenComplete(
            () => Fluttertoast.showToast(
            msg: 'Update Complete',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16),
      ).then((value) =>
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyProfile()),
                  (route) => false),
      ); //writing to firebase
    } catch (e) {
      setState(() {
        const CircularProgressIndicator(
          backgroundColor: Colors.red,
        );
      });
      Fluttertoast.showToast(
          msg: '$e',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16);
    }
  }

}
