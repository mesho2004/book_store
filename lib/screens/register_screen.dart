import 'package:book_store/screens/login_screen.dart';
import 'package:book_store/widgets/custom_textField.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> register() async {
    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    // if (username.isEmpty ||
    //     email.isEmpty ||
    //     password.isEmpty ||
    //     confirmPassword.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Please fill all fields')),
    //   );
    //   return;
    // }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      final response = await Dio().post(
        'https://api.codingarabic.online/api/auth/register',
        data: {
          'username': username,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword
        },
      );
      print(response.data);

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => loginScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Registration failed: ${response.data['message']}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hello! Register to get started",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            CustomTextfield(
              text: "username",
              control: usernameController,
            ),
            SizedBox(height: 15.0),
            CustomTextfield(
              text: "Email",
              control: emailController,
            ),
            SizedBox(height: 15.0),
            CustomTextfield(
              text: "password",
              control: passwordController,
            ),
            SizedBox(height: 15.0),
            CustomTextfield(
              text: "Confirm password",
              control: confirmPasswordController,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC6A862), 
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: register,
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
                  Text(
                    "Already have an account",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginScreen()));
                      },
                      child: Text(
                        "Login Now",
                        style: TextStyle(color: Color(0xFFC6A862)),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
