import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPressedFunction;

  const CustomCard({
    required this.image,
    required this.title,
    required this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedFunction,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
