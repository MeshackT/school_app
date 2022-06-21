
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:school_app/ResetPassword.dart';
import 'package:school_app/SelectorPage.dart';

import 'SignUpPage.dart';


Center circleProgress() {
  return  const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.redAccent),
    ),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/LogInPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

  bool validationAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return false;
    }
    return true;
  }


  TextEditingController codeUnit = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        const Text ("Login", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 20,),
                        Text("Welcome back! Use your credentials to login",style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),),
                        const SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Code Unit",
                              style:  TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87
                              ),
                            ),
                            const SizedBox(height: 5,),
                            TextFormField(
                              controller: codeUnit,
                              obscureText: true,
                              onSaved: (value){
                                setState(() {
                                  codeUnit.text = value!;
                                });
                              },
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return ("Enter a Code");
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
                            const Text("Password",
                              style:  TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87
                              ),
                            ),
                            const SizedBox(height: 5,),
                            TextFormField(
                              controller: password,
                              obscureText: true,
                              onSaved: (value){
                                setState(() {
                                  password.text = value!;
                                });
                              },
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return ("Enter a password");
                                }
                                if (value.length < 5) {
                                  return ("Please Enter a valid password");
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
                          ],)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Forgot my password?"),
                          TextButton(
                              onPressed: (){
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => const ResetPassword(),
                                  ),
                                );
                              },
                              child: const Text("Reset",
                                style: TextStyle(color: Colors.redAccent),)
                          ),
                        ],
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
                            if (_formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              //get the use
                              // r information
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
                              _userSignIn(email.text, password.text)
                                  .whenComplete(() =>
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SelectorPage()),
                                          (route) => false),
                              );
                              }
                            },
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)
                          ),
                          child: const Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white
                          ),),

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                            onPressed: (){
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const SignupPage(),
                              ),
                            );
                          },
                            child: const Text("SignUp",
                            style: TextStyle(color: Colors.redAccent),)
                        ),
                      ],
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
  Future<User?> _userSignIn(String email, String password) async {
    final _auth = FirebaseAuth.instance;
    User? user = FirebaseAuth.instance.currentUser;
    Logger log= Logger(
        printer: PrettyPrinter(colors: true)
    );
    try {
      await _auth
          .signInWithEmailAndPassword(
          email: email.trim().toLowerCase(), password: password.trim())
          .then((uid) => {
        log.i(user!.uid + " logged in"),
        Fluttertoast.showToast(msg: "Login Success"),
        /*Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const SelectorPage()),
                (route) => false),*/
      });
    } on FirebaseAuthException catch (e) {
      //if user is not found then display this msg
      if (e.code == 'user-not-found') {
        log.i("user not found!");
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.grey,
            fontSize: 16.0);
      } else if (e.code == 'wrong-password') {
        log.i("wrong password");
        Fluttertoast.showToast(
            msg: 'Wrong password provided for that user.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.grey,
            fontSize: 16.0);
      }
    }
    return null;
  }
}
