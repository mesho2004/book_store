import 'package:book_store/screens/forgot_password.dart';
import 'package:book_store/screens/home_layout.dart';
import 'package:book_store/screens/register_screen.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}
var isObsecure=true;

@override
void initState(){

  isObsecure;
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 60,),
            // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios),),
            SizedBox(height: 20,),
            Text("Welcome back! Glad to see you, Again!",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 30,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: passwordController,
              obscureText: isObsecure,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon:IconButton(
                  icon: isObsecure? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isObsecure =!isObsecure;
                    });
                  },
                )
              ),
              ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotPassword()),);
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          SizedBox(height: 20.0),
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
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill all fields')),
        );
      }
      else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeLayout()));
      }
    },
      child: Text(
        'Login',
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
                  child: Text("Or Login with"),
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
                  },
                ),
                IconButton(
                  icon: Image.asset('Assets/images/google.png'),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Image.asset('Assets/images/apple.png'),
                  onPressed: () {
                  },
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(
                    color: Colors.black,
                  ),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>registerScreen()));

                  }, child: Text("Register Now",style: TextStyle(
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
