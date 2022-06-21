import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_app/LoginPage.dart';

import 'Authentication/LoginRegistrationClass.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  static const routeName = '/ResetPassord';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}


class _ResetPasswordState extends State<ResetPassword> {
  final LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();
  bool validationAndSave() {
    final form = loginRegistrationClass.formKey.currentState;
    if (form!.validate()) {
      form.save();
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();

    return Scaffold(
      key: loginRegistrationClass.scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
        backgroundColor: Colors.redAccent,
        title: const Text('Reset Password'),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: loginRegistrationClass.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin:  const EdgeInsets.only(bottom: 5, top: 5),
                    child: Center(
                        child: Text(
                          "Reset Password",
                          style: loginRegistrationClass.textStyle(),
                        )),
                  ),

                  ////////Card////////
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Card(
                        elevation: 2.0,
                        shadowColor: Colors.grey,
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin:
                                const EdgeInsets.only(bottom: 20, top: 20),
                                child: TextFormField(
                                  controller: email,
                                  onSaved: (value) {
                                    setState(() {
                                      email.text = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enter an email");
                                    }
                                    if (!value.contains("@")) {
                                      return ("Please Enter a valid valid email");
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  style: loginRegistrationClass.textStyle4(),
                                  decoration: InputDecoration(
                                    label: const Text('Email'),
                                    hintText: 'Email',
                                    prefix: Icon(
                                      Icons.email,
                                      color: loginRegistrationClass.iconColor(),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 15.0,
                              ),
                              //////////////buttons///////////////
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.redAccent),
                                    padding:
                                    MaterialStateProperty.all<EdgeInsets>(
                                        const EdgeInsets.all(15)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28.0),
                                        side:
                                        const BorderSide(color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (loginRegistrationClass.formKey.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      //get the use
                                      // r information
                                      loginRegistrationClass.scaffoldKey.currentState!.showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.redAccent,
                                          duration:  const Duration(seconds: 5), content:
                                        Row(
                                          children: const <Widget>[
                                            CircularProgressIndicator(),
                                            Text("Check your email for a link sent", style: TextStyle(color: Colors.white),)
                                          ],
                                        ),
                                        ),
                                      );
                                      _passwordReset(
                                        email.text,
                                      ).then((value) =>
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => const LoginPage(),
                                            ),
                                          )
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Reset Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: Divider(
                                  height: 4.0,
                                  color: Colors.grey,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) => const LoginPage()));
                                },
                                child: const Text(
                                  "LogIn",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  const Padding(
                    padding: EdgeInsets.only(left: 80.0, right: 80.0, top: 20.0),
                    child: Divider(
                      height: 10.0,
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _passwordReset(String email) async {
    final _auth = FirebaseAuth.instance;
    try {
      return _auth.sendPasswordResetEmail(email: email.trim().toLowerCase());
    } on FirebaseAuthException catch (e){
      //if user is not found then display this msg
        Fluttertoast.showToast(
            msg: e.code,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.grey,
            fontSize: 16.0);
      }
    }

}
