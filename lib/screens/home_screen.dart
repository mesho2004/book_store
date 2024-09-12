import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:book_store/screens/cart.dart';
import 'package:book_store/screens/favorites_screen.dart';
import 'package:book_store/screens/profileScreen/profile_screen.dart';
import 'package:book_store/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    cartScreen(),
    ProfileScreen(),
  ];

  List books = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      final response = await Dio().get('https://api.codingarabic.online/api/books');
      setState(() {
        books = response.data["data"];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to fetch books')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              width: 450,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("Assets/images/back.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Find out the best books to read",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Explore"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return CustomCard(
                        image: book['image_url'] ?? 'Assets/images/book.png',
                        title: book['title'],
                        onPressedFunction: () {},
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
