import 'package:book_store/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class cartScreen extends StatefulWidget {
   cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView(
            children: [
              CartItem(title: 'BOOK', price: 250,  image: 'Assets/images/back.png'),
              CartItem(title: 'BOOK', price: 250, image: 'Assets/images/back.png'),
              CartItem(title: 'BOOK', price: 250,  image: 'Assets/images/back.png'),
              CartItem(title: 'BOOK', price: 250, image: 'Assets/images/back.png'),


            ],
          ),

          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Divider(),
              Row(
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "1000",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color(0xFFB1975A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("checkout",style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
              SizedBox(height: 20,)


            ],
          ),

          ),

        ],

      )
    );
  }
}
