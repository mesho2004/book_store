import 'package:book_store/books/presentation/screens/main_screen.dart';
import 'package:book_store/core/features/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/features/cubit/auth_cubit.dart';
import 'core/features/cubit/favourite_cubit.dart'; 

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => FavoritesCubit()), 
        BlocProvider(create: (context)=> CartCubit()),
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
      home: mainScreen(), 
    );
  }
}
