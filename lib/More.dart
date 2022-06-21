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
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Generals",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {  },
                      child: const Text("one time payment to Remove ads forever",
                      style:  TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              const Text("Theme",
                style: TextStyle(
                color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(

                  children: [
                    const Text("Dark Theme",
                      style: TextStyle(
                        color: Colors.black,
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
              const Text("About",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: (){},
                      child: Text("Share with a Friend",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child: Text("More Apps",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child: Text("Send a FeedBack",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child: Text("More Apps",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text("Follow us",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: (){},
                      child: Text("Twitter",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child: Text("Instagram",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child: Text("FaceBook",
                        style: TextStyle(
                            color: Colors.black,
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
