import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:school_app/Authentication/LoginRegistrationClass.dart';
import 'package:school_app/Authentication/ReusableWidgets.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);
  static const routeName = '/Feeds';


  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {

  ReusableWidgets reusableWidgets= ReusableWidgets();
  LoginRegistrationClass loginRegistrationClass = LoginRegistrationClass();

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('createdFeeds').orderBy('time', descending: true).snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(color: Colors.redAccent),
                SizedBox(height: 10.0,),
                Text("Something went wrong"),
              ],
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                /*CircularProgressIndicator(color: Colors.redAccent),
                SizedBox(height: 10.0,),
*/                Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child:   LinearProgressIndicator(

                    valueColor: AlwaysStoppedAnimation(Colors.green),

              ),
)
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.size,
          itemBuilder: (BuildContext context, int index){
            DocumentSnapshot data = snapshot.data!.docs[index];
            return Dismissible(background: Container(
              color: Colors.white,
            ),
              behavior: HitTestBehavior.opaque,
              crossAxisEndOffset: 0.2,
              direction: DismissDirection.endToStart,
              dragStartBehavior: DragStartBehavior.start,
              movementDuration: const Duration(milliseconds: 200),
              resizeDuration: const Duration(milliseconds: 1000),
              secondaryBackground: Container(
                color: Colors.grey[400],
                alignment: AlignmentDirectional.centerEnd,
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              key: Key(data.id),
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                    FirebaseFirestore.instance
                        .collection('createdFeeds')
                        .doc(data.id)
                        .delete()
                        .then((value) => loginRegistrationClass.log.i(data.id));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.black38,
                        content: Text('Feed Dismissed'),
                      ),
                    );
                  },
                );
              },
              child: Card(
                elevation: 2,
                shadowColor: Colors.black,
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    trailing: Column(
                      children: [
                        Text(data['sendersName'],
                            style: loginRegistrationClass.textStyle()),
                        loginRegistrationClass.space(),
                        loginRegistrationClass.space(),

                        Text(
                          data['time'],
                        )
                      ],
                    ),
                    //leading: Text(data['sendersName'], style: reusableWidgets.textStyleDarkest()),
                    title: Text("About: "+ data['feedName'],
                      style: loginRegistrationClass.textStyle2(),),
                    subtitle: Text("Note: "+ data['feedNews']),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 0, left: 0.0, top: 20.0),
                        child: Divider(
                          height: 2,
                          color: Colors.black38,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date: "+ loginRegistrationClass
                                    .formattedDate(data['date']), style: reusableWidgets.textStyleLightDark()
                                ),
                                Text("Subject: "+ data['subjectType'], style: reusableWidgets.textStyleLightDark()),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.edit, color: loginRegistrationClass.iconColor(),),)
                        ]
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
