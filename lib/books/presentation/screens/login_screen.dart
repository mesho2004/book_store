import 'package:book_store/books/presentation/screens/forgot_password.dart';
import 'package:book_store/books/presentation/screens/home_layout.dart';
import 'package:book_store/books/presentation/screens/register_screen.dart';
import 'package:book_store/core/features/auth/cubit/auth_cubit.dart';
import 'package:book_store/core/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isObsecure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is loginSuccessState) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeLayout()),
                );
              } else if (state is loginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  const SizedBox(height: 60),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome back! Glad to see you, Again!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
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
                      suffixIcon: IconButton(
                        icon: isObsecure
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const forgotPassword(),
                        ),
                      );
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC6A862),
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: state is loginLoadingState
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                      userEmail: emailController.text,
                                      password: passwordController.text,
                                    );
                              }
                            },
                      child: state is loginLoadingState
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(fontSize: 18.0, color: Colors.white),
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      Expanded(child: Divider(thickness: 1.5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Or Login with"),
                      ),
                      Expanded(child: Divider(thickness: 1.5)),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Image.asset('Assets/images/facebook.png'),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset('Assets/images/google.png'),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset('Assets/images/apple.png'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const registerScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Register Now",
                            style: TextStyle(color: Color(0xFFC6A862)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
