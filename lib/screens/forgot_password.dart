import 'package:book_store/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class forgotPassword extends StatelessWidget {
  const forgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios),),
            SizedBox(height: 20,),
            Text("Forgot Password ?",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            Text("Don't worry! It occurs",style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20
            ),),
            SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: CustomButton(width: double.infinity,title: "send code",buttonInsets: EdgeInsets.symmetric(vertical: 15),fontsize: 18,onPressedFunction: (){},buttonColor: Color(0xFFC6A862),),
            ),
            Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Remember Password?",style: TextStyle(
                    color: Colors.black,
                  ),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginScreen()));

                  }, child: Text("Login",style: TextStyle(
                      color: Color(0xFFC6A862)
                  ),))
                ],

              ),

            ),



          ],

        ),
      ),

    );
  }
}
