import 'package:flutter/material.dart';
import 'package:school_app/Authentication/LoginRegistrationClass.dart';
import 'SelectorPage.dart';

class CreateAFeed extends StatefulWidget {
  const CreateAFeed({Key? key}) : super(key: key);
  static const routeName = '/createAFeedPage';

  @override
  State<CreateAFeed> createState() => _CreateAFeedState();
}

class _CreateAFeedState extends State<CreateAFeed> {
  final LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();

  String feedCodePassword = "school";

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
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.redAccent,
        title: const Text("Create a feed",
          style: TextStyle(color: Colors.white),),
        centerTitle: true,

        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SelectorPage()));

          },

        ),
      ),
      backgroundColor: Colors.red.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 0.0),

            child:
            SizedBox(
              height: 550,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.white70,
                elevation: 0.2,
                shadowColor: Colors.black,
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Form(
                    key: loginRegistrationClass.formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          child: TextFormField(
                            controller: loginRegistrationClass.feedCode,
                            obscureText: true,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return ("Enter your code");
                              }else if(value.trim() != feedCodePassword){
                                return ("incorrect code");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                loginRegistrationClass.feedCode.text = value!;
                              });
                            },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                            decoration: InputDecoration(
                              label: const Text(
                                'Feed Code',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                              hintText: '*********',
                              prefix: Icon(
                                Icons.lock,
                                color: loginRegistrationClass.iconColor(),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          child: TextFormField(
                            controller: loginRegistrationClass.sendersName,
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
                                'Senders Name',
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
                        ////////////////////////////////////////////////////
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
                                return ("Enter the feed name");
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                            decoration:  InputDecoration(
                              prefix: Icon(
                                Icons.report,
                                color: loginRegistrationClass.iconColor(),
                              ),
                              label: const Text(
                                'Feed Name',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                              hintText: 'Example: Stolen Device',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ////////////////////////////////////////////////////
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
                                'Feed Details',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                              hintText: 'Feed Details',
                              prefix: Icon(
                                Icons.details,
                                color: loginRegistrationClass.iconColor(),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: TextFormField(
                            controller: loginRegistrationClass.grade,
                            onSaved: (value) {
                              setState(() {
                                loginRegistrationClass.grade.text = value!;
                              });
                            },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.grey),
                            decoration:  InputDecoration(
                              label:const Text(
                                'Grade',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                              hintText: 'Grade 11',
                              prefix: Icon(
                                Icons.grade,
                                color:loginRegistrationClass.iconColor(),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: TextFormField(
                            controller: loginRegistrationClass.subjectType,
                            onSaved: (value) {
                              setState(() {
                                loginRegistrationClass.subjectType.text = value!;
                              });
                            },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.grey),
                            decoration:  InputDecoration(
                              label:const Text(
                                'Subject Type',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                              prefix: Icon(
                                Icons.subject,
                                color:loginRegistrationClass.iconColor(),
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
                              //get the use
                              // r information
                              loginRegistrationClass.scaffoldKey.currentState!.showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  duration:  const Duration(seconds: 4), content:
                                Row(
                                  children: const <Widget>[
                                    CircularProgressIndicator(),
                                    Text("  Creating a feed...")
                                  ],
                                ),
                                ),
                              );
                              loginRegistrationClass.addFeedRequest(context);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const SelectorPage(),
                                ),
                            );


                            }
                          },
                          child: const Text(
                            "Create",
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
        ),
      ),
    );
  }
}