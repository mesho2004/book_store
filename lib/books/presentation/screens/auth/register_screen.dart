import 'package:book_store/books/presentation/screens/home_screen.dart';
import 'package:book_store/books/presentation/screens/auth/login_screen.dart';
import 'package:book_store/books/presentation/screens/widgets/custom_textField.dart';
import 'package:book_store/core/features/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void initState() {
    super.initState();
  }

  // Future<void> _checkToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');

  //   if (token != null) {
  //     try {
  //       final response = await Dio().post(
  //         'https://api.codingarabic.online/api/auth/check-token',
  //         options: Options(
  //           headers: {
  //             'token_type': 'Bearer $token',
  //           },
  //         ),
  //       );

  //       if (response.statusCode == 200) {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context)=>HomeScreen()));
  //       } else {
  //         _clearToken();
  //       }
  //     } catch (e) {
  //       _clearToken();
  //     }
  //   }
  // }

  // Future<void> _clearToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('token');
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => loginScreen()),
  //   );
  // }

  // Future<void> _saveToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', token);
  // }

  // Future<void> register() async {
  //   final String username = usernameController.text;
  //   final String email = emailController.text;
  //   final String password = passwordController.text;
  //   final String confirmPassword = confirmPasswordController.text;

  //   if (password != confirmPassword) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Passwords do not match')),
  //     );
  //     return;
  //   }

  //   try {
  //     final response = await Dio().post(
  //       'https://api.codingarabic.online/api/auth/register',
  //       data: {
  //         'username': username,
  //         'email': email,
  //         'password': password,
  //         'password_confirmation': confirmPassword,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       String token = response.data['token'];
  //       await _saveToken(token);

  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => HomeScreen()),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //             content:
  //                 Text('Registration failed: ${response.data['message']}')),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error: $e')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 60),
            Text(
              "Hello! Register to get started",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
            SizedBox(height: 20),
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
                onPressed: () async {
                  await AuthCubit().register(
                      userName: usernameController.text,
                      password: passwordController.text,
                      passwordConfirm: confirmPasswordController.text,
                      userEmail: emailController.text);
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Login Now",
                      style: TextStyle(color: Color(0xFFC6A862)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
