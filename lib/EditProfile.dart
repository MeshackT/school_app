import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: loginRegistrationClass.scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Column(
                      children: const [
                        Text ("Update", style: TextStyle(
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
                                  obscureText: true,
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
                                const Text("Phone Number",
                                  style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                TextFormField(
                                  controller: phoneNumber,
                                  obscureText: true,
                                  onSaved: (value){
                                    setState(() {
                                      phoneNumber.text = value!;
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
                                    Text("  Updating...")
                                  ],
                                ),
                                ),
                              );
                              /*_userSignIn(email.text, password.text)
                                  .whenComplete(() =>
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SelectorPage()),
                                          (route) => false),
                              );*/
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
                    const SizedBox(height: 10.0,),
                    TextButton(
                        onPressed: (){
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const MyProfile(),
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
          ),
        ),
      ),
    );
  }
}
