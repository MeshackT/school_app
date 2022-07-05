import 'package:flutter/material.dart';
import 'package:school_app/Authentication/LoginRegistrationClass.dart';
import 'SelectorPage.dart';



class CreateAReport extends StatefulWidget {
  const CreateAReport({Key? key}) : super(key: key);
  static const routeName = '/createAReportPage';


  @override
  _CreateAReportState createState() => _CreateAReportState();
}

class _CreateAReportState extends State<CreateAReport> {
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
    return Scaffold(
      key: loginRegistrationClass.scaffoldKey,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.redAccent,
        title: const Text("Create a Report",
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
              Card(
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
                                'Reporters Name',
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
                            controller: loginRegistrationClass.reportName,
                            onSaved: (value) {
                              setState(() {
                                loginRegistrationClass.reportName.text = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Enter the report name");
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
                                'Report Name',
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
                            controller: loginRegistrationClass.reportDetails,
                            onSaved: (value) {
//Do something with the user input.
                              setState(() {
                                loginRegistrationClass.reportDetails.text = value!;
                              });
                            },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                            decoration: InputDecoration(
                              label: const Text(
                                'Report Details',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                              hintText: 'Report Details',
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
                            controller: loginRegistrationClass.phoneNumber,
                            onSaved: (value) {
                              setState(() {
                                loginRegistrationClass.phoneNumber.text = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Enter you phone Number");
                              }
                              if (value.length < 10) {
                                return ("Enter a valid phone number with 10 digits");
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.grey),
                            decoration:  InputDecoration(
                              label:const Text(
                                'Phone number',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                              hintText: '0123456789',
                              prefix: Icon(
                                Icons.phone,
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
                            controller: loginRegistrationClass.imagePicker,
                            onSaved: (value) {
                              setState(() {
                                loginRegistrationClass.imagePicker.text = value!;
                              });
                            },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.grey),
                            decoration:  InputDecoration(
                              label:const Text(
                                'Image',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                              prefix: Icon(
                                Icons.image,
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
                                    Text("  Creating a report...")
                                  ],
                                ),
                                ),
                              );
                              loginRegistrationClass.addReportRequest(context);

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
    );
  }
}
