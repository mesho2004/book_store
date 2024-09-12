import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const ProfileMenuItem({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(text),
        trailing: Icon(icon),
        onTap: onPressed,
      ),
    );
  }
}
