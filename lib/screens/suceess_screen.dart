import 'package:book_store/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SuceessScreen extends StatelessWidget {
  const SuceessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("Assets/images/success.png"),
            SizedBox(height: 20),
            Text(
              "SUCCESS!",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Your order will be deliverd soon",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Thank you for choosing our app",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
             SizedBox(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color(0xFFB1975A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Back To Home",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
