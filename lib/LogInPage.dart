
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/Feeds.dart';
import 'package:school_app/SelectorPage.dart';

import 'SignUpPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/LogInPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },
            icon:const  Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,)), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SizedBox(
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
                    Text("Welcome back ! Login with your credentials",style: TextStyle(
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
                  child: Column(
                    children: [
                      makeInput(label: "Email"),
                      makeInput(label: "Password",obsureText: true),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3,left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black)
                        )
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height:60,
                      onPressed: (){
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const SelectorPage(),
                          ),
                        );

                      },
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: const Text("Login",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70
                      ),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
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
                        child: const Text("SignUp")
                    ),
                  ],
                )
              ],

            ),
          ],
        ),
      ),
    );
  }
}

Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),
      ),
      const SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
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
      const SizedBox(height: 30,)

    ],
  );
}
