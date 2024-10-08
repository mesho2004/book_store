import 'package:book_store/books/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/features/auth/cubit/auth_cubit.dart';
import 'core/features/auth/cubit/favourite_cubit.dart'; // Import FavoritesCubit

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => FavoritesCubit()), // Add FavoritesCubit
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainScreen(), // Always use PascalCase for widget names (MainScreen)
    );
  }
}
