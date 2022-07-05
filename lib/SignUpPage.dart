import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_app/Authentication/LoginRegistrationClass.dart';
import 'package:school_app/LoginPage.dart';

import 'Authentication/UserModel.dart';
import 'SelectorPage.dart';

Center circleProgress() {
  return  const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.redAccent),
    ),
  );
}
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static const routeName = '/SignUpPage';

  //SignupPage(this.fullName, this.company, this.age);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _auth = FirebaseAuth.instance;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final UserModel userModel = UserModel();

  LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();

  final TextEditingController codeUnit = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController retypePassword = TextEditingController();
  final TextEditingController subjectTeaching = TextEditingController();
  final TextEditingController grade = TextEditingController();
  final TextEditingController name = TextEditingController();

  String learnerCode = "Learner05";
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

    return Scaffold(
      key: loginRegistrationClass.scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red.shade50,

      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text ("Sign up", style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(height: 20,),
                            Text("Create an Account,Its free",style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),),
                            const SizedBox(height: 30,)
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
                                    const Text("Code Unit",
                                      style:  TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    TextFormField(
                                      obscureText: true,
                                      controller: codeUnit,

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
                                      obscureText: false,
                                      controller: email,
                                      onSaved: (value){
                                        setState(() {
                                          email.text = value!.trim().toLowerCase();
                                        });
                                      },
                                      validator: (value) {
                                        if (value!.trim().isEmpty) {
                                          return ("Enter a valid email");
                                        }
                                        if (!value.trim().toLowerCase().contains('@')) {
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
                                      obscureText: true,
                                      controller: password,
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
                                    const SizedBox(height: 5,),
                                    const Text("Retype Password"),
                                    TextFormField(
                                      obscureText: true,
                                      controller: retypePassword,

                                      onSaved: (value){
                                        setState(() {
                                          retypePassword.text = value!;
                                        });
                                      },
                                      validator: (value) {
                                        if(retypePassword.text != password.text){
                                          return ("Passwords don't match");
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
                                    const SizedBox(height: 5,),
                                    const Text("Name"),
                                    TextFormField(
                                      obscureText: false,
                                      controller: name,

                                      onSaved: (value){
                                        setState(() {
                                          name.text = value!;
                                        });
                                      },
                                      validator: (value) {
                                        if(retypePassword.text != password.text){
                                          return ("Please enter you name");
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
                                    const SizedBox(height: 5,),
                                    const Text("Teaching Subject"),
                                    TextFormField(
                                      obscureText: false,
                                      controller: subjectTeaching,

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
                                    const SizedBox(height: 5,),
                                    const Text("Grade"),
                                    TextFormField(
                                      obscureText: false,
                                      controller: grade,

                                      onSaved: (value){
                                        setState(() {
                                          grade.text = value!;
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
                          padding: const EdgeInsets.symmetric(horizontal: 40,  vertical: 8),
                          child: Container(
                            padding: const EdgeInsets.only(top: 3,left: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height:60,
                              onPressed: () async{
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
                                        Text("  Registering User...")
                                      ],
                                    ),
                                    ),
                                  );
                                  registerUsers(email.text, password.text)
                                      .whenComplete(() =>
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const SelectorPage()),
                                              (route) => false),
                                  );
                                }

                                setState(() {
                                  circleProgress();
                                });
                              },
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: const Text("Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white

                                ),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                                onPressed: (){
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text("LogIn",
                                  style: TextStyle(color: Colors.redAccent),)
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                //Align(child: loadingIndicator,alignment: FractionalOffset.center,),

              ],
            ),

          ),
        ),
      ),
    );




  }

  Future<void> registerUsers(String email, String password) async {
    if (loginRegistrationClass.formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email.trim().toLowerCase(), password: password.trim())
          .then((value) => {
        postDetailsToFirebase(),
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: "Failed to login!" + e!.message);
        loginRegistrationClass.log.i(e);
      });
    }
  }

  postDetailsToFirebase() async {
    final User? user = _auth.currentUser;

    //writing to firebase
    //adding the details to the constructor
    userModel.uid = user?.uid;
    userModel.email = email.text.trim().toLowerCase();
    userModel.password = password.text.trim();
    userModel.name = name.text.trim();
    userModel.grade = grade.text.trim();
    userModel.subjectTeaching = subjectTeaching.text.trim();

    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .set(userModel.toMap()).then((value) =>  circleProgress());
    loginRegistrationClass.log.i(userModel.toMap());

    Fluttertoast.showToast(msg: "account created successfully");
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SelectorPage()),
        result: (route) => false);
  }

}


