import 'package:book_store/core/features/cubit/cart_cubit.dart';
import 'package:book_store/core/features/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

class BookDetails extends StatefulWidget {
  final int bookId;

  const BookDetails({Key? key, required this.bookId}) : super(key: key);

  @override
  BookDetailsState createState() => BookDetailsState();
}

class BookDetailsState extends State<BookDetails> {
  Map<String, dynamic> bookData = {};
  bool isLoading = true;

  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchBookDetails();
  }

  Future<void> fetchBookDetails() async {
    try {
      int id = widget.bookId;

      final response = await dio.get('https://api.codingarabic.online/api/books/$id');

      if (response.statusCode == 200) {
        setState(() {
          bookData = response.data["data"];
          isLoading = false;
        });
      } else {
        print('Failed to load book data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {
              context.read<FavoritesCubit>().addToFavorites(bookData);
              Fluttertoast.showToast(
                msg: 'Book added to favorites!',
                backgroundColor: Colors.green,
                textColor: Colors.white,
                gravity: ToastGravity.BOTTOM,
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      child: Image.network(
                        bookData['image'] ?? 'https://via.placeholder.com/150',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    bookData['title'] ?? 'Unknown Title',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    bookData['description'] ?? 'No description available.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${bookData['price'] ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final priceString = bookData['price'].toString();
                          final price = double.tryParse(priceString) ?? 0.0;

                          final bookWithNumericPrice = {
                            ...bookData,
                            'price': price,
                          };

                          context.read<CartCubit>().addToCart(bookWithNumericPrice);

                          Fluttertoast.showToast(
                            msg: 'Book added to cart!',
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            gravity: ToastGravity.BOTTOM,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
