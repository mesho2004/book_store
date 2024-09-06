import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.width,required this.title, required this.buttonInsets, required this.fontsize,required this.onPressedFunction,required this.buttonColor});
  double? width;
  String title;
  EdgeInsets? buttonInsets;
  double? fontsize;
  Function() onPressedFunction;
  Color buttonColor;




  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: buttonInsets,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressedFunction(),
        child: Text(
          title,
          style: TextStyle(fontSize: fontsize,color: Colors.white),

        ),
      ),


    );
  }
}

