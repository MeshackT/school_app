import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 20),

      decoration: BoxDecoration(

          color: Colors.blue,

          border: Border.all(color: Colors.white),

          borderRadius: BorderRadius.circular(0)),

      child: Material(

        color: Colors.transparent,

        child: InkWell(

          onTap: (){},

          child: Container(

            padding: const EdgeInsets.all(20),

            child: const Center(

              child: Text(

                'first button',

                style: TextStyle(

                    color: Colors.white,

                    fontSize: 16,

                    fontWeight: FontWeight.w400),

              ),

            ),

          ),

        ),

      ),

    );
  }
}

