import 'package:book_store/books/presentation/screens/profileScreen/order_screen.dart';
import 'package:book_store/books/presentation/screens/profileScreen/resetPassword.dart';
import 'package:book_store/books/presentation/screens/widgets/profileMenuItem.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ahmed Eisa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'meshopro5@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ProfileMenuItem(
                    text: 'My Orders',
                    icon: Icons.arrow_forward_ios,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyOrdersScreen()));
                    },
                  ),
                  ProfileMenuItem(
                    text: 'Edit Profile',
                    icon: Icons.arrow_forward_ios,
                    onPressed: () {},
                  ),
                  ProfileMenuItem(
                    text: 'Reset Password',
                    icon: Icons.arrow_forward_ios,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewPasswordScreen()));
                    },
                  ),
                  ProfileMenuItem(
                    text: 'FAQ',
                    icon: Icons.arrow_forward_ios,
                    onPressed: () {},
                  ),
                  ProfileMenuItem(
                    text: 'Contact Us',
                    icon: Icons.arrow_forward_ios,
                    onPressed: () {},
                  ),
                  ProfileMenuItem(
                    text: 'Privacy & Terms',
                    icon: Icons.arrow_forward_ios,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
