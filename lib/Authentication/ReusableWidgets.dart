import 'package:flutter/material.dart';
class ReusableWidgets{

  ////////////////////////
  // CIrcle Progress Bar//
  ////////////////////////
  Center circleProgress(){
    return  const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.redAccent),
      ),
    );
  }
  ////////////////////////
  // Linear Progress Bar//
  ////////////////////////
  linearProgress(){
    return const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.redAccent),
    );
  }
  TextStyle textStyleDarkest(){
    return const TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,color: Colors.black) ;
  }
  TextStyle textStyleDarker(){
   return const TextStyle(fontSize: 14.0, color: Colors.black45) ;
  }
  TextStyle textStyleLightDark(){
    return const TextStyle(fontSize: 14.0,color: Colors.black38) ;
  }

}

