import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/features/auth/cubit/favourite_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoritesCubit, List<Map<String, dynamic>>>(
        builder: (context, favoriteBooks) {
          if (favoriteBooks.isEmpty) {
            return Center(
              child: Text('No favorite books yet.'),
            );
          }
          return ListView.builder(
            itemCount: favoriteBooks.length,
            itemBuilder: (context, index) {
              final book = favoriteBooks[index];
              return ListTile(
                title: Text(book['title']),
                leading: Image.network(
                  book['image'] ?? 'https://via.placeholder.com/150',
                  width: 50,
                  height: 50,
                ),
                subtitle: Text('₹${book['price']}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    BlocProvider.of<FavoritesCubit>(context).removeFromFavorites(book['id']);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
