import 'package:flutter/material.dart';
import 'package:school_app/Authentication/LoginRegistrationClass.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);
  static const routeName = '/More';

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();
    return SingleChildScrollView(

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        color: Colors.red.shade50,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Container(
                margin: const EdgeInsets.only(right: 20.0),
                color: Colors.red.shade100,
                alignment: Alignment.centerLeft,
                height: 30,
                child: const Text("Generals",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {  },
                      child: const Text("one time payment to Remove ads forever",
                      style:  TextStyle(
                        color: Colors.black38,
                        fontSize: 14,
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                color: Colors.red.shade100,
                alignment: Alignment.centerLeft,
                height: 30,
                child: const Text("Theme",
                  style: TextStyle(
                  color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(

                  children: [
                    const Text("Dark Theme",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14,

                      ),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.check_box_outline_blank),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                color: Colors.red.shade100,
                alignment: Alignment.centerLeft,
                height: 30,
                child: const Text("About",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    TextButton(
                      onPressed: (){},
                      child: const Text("Share with a Friend",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: const Text("More Apps",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child: const Text("Send a FeedBack",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: const Text("More Apps",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                color: Colors.red.shade100,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(right: 20.0),
                child: const Text("Follow us",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: (){},
                      child:const Text("Twitter",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child: const Text("Instagram",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child: const Text("FaceBook",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
