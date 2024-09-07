import 'package:book_store/screens/login_screen.dart';
import 'package:book_store/widgets/custom_textField.dart';
import 'package:flutter/material.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,), SizedBox(height: 20,),
            Text("Hello! Register to get started",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 30.0),

           CustomTextfield(text: "username"),
            SizedBox(height: 15.0),
          CustomTextfield(text: "Email"),
            SizedBox(height: 15.0),
           CustomTextfield(text: "password"),
            SizedBox(height: 15.0),
           CustomTextfield(text: "Comfirm password"),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC6A862), // Button color
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  // Add login logic here
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18.0,color: Colors.white),

                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(child: Divider(thickness: 1.5)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Or Register with"),
                ),
                Expanded(child: Divider(thickness: 1.5)),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('Assets/images/facebook.png'),
                  onPressed: () {
                    // Add Facebook login logic here
                  },
                ),
                IconButton(
                  icon: Image.asset('Assets/images/google.png'),
                  onPressed: () {
                    // Add Google login logic here
                  },
                ),
                IconButton(
                  icon: Image.asset('Assets/images/apple.png'),
                  onPressed: () {
                    // Add Apple login logic here
                  },
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account",style: TextStyle(
                    color: Colors.black,
                  ),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginScreen()));

                  }, child: Text("Logun Now",style: TextStyle(
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
