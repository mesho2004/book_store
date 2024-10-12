import 'package:book_store/core/features/cubit/cart_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkout_screen.dart';
import 'widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocBuilder<CartCubit, List<Map<String, dynamic>>>(
        builder: (context, cartItems) {
          if (cartItems.isEmpty) {
            return Center(
              child: Text('No items in the cart.'),
            );
          }

          double totalPrice = context.read<CartCubit>().getTotalPrice();

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return CartItem(
                      title: item['title'] ?? 'Unknown',
                      image: item['image'] ?? 'https://via.placeholder.com/150',
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Divider(),
                   
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CheckoutScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Color(0xFFB1975A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Checkout",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
