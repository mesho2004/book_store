import 'package:book_store/widgets/custom_favorite_card.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          CustomFavoriteCard(title: "book",image: "Assets/images/back.png",onPressedF: (){},price: "250",)
        ],
      ),
    );
  }
}
