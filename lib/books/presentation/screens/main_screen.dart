import 'package:book_store/books/presentation/screens/login_screen.dart';
import 'package:book_store/books/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("Assets/images/background.png"),
          fit: BoxFit.cover
          ),
          ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset("Assets/images/logo.png",height: 80,),
                SizedBox(height: 10,),
                Text("Order Your Book Now!",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),),
                SizedBox(height: 55,),

                Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC6A862),
                      minimumSize: Size(double.infinity, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),



                    ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()),);

                    },
                    child: Text("Login",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),

                  ),


                ),
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.black54),

                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>registerScreen(),));

                  },
                  child: Text("Register",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                )
              ],
            )
          ],
        ),

      ),


    );
  }
}
