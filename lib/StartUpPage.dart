import 'package:flutter/material.dart';
import 'package:school_app/LogInPage.dart';
import 'package:school_app/SignUpPage.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);
  static const routeName = '/LogIn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hello There!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    SizedBox(height: 30,),
                    Text("Lets create you a new account or logIn",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  decoration: const BoxDecoration(
                      image:DecorationImage(image: AssetImage('assets/illustration.jpg'))
                  ),
                ),


            MaterialButton(
                  minWidth: double.infinity,
                  height:60,
                  onPressed: (){
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SignupPage(),
                      ),
                    );
                  },
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 16,

                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height:60,
                  onPressed: (){
                    print("SignIn pressed");
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const LoginPage(),
                      ),
                    );                  },
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 16,

                    ),
                  ),
                ),
              ],
            ),
        ),

      ),
    );
  }
}
