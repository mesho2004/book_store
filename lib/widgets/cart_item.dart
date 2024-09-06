import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
   String title;
   double price;
   int quantity=1;
   String image;

  CartItem({
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int increaseCounter(int counter){
    counter+=1;
    return counter;

  }

  int decreaseCounter(int counter){
    counter-=1;
    if(counter>=1)  return counter;
    else return 1;


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                    widget.image, width: 60, height: 60, fit: BoxFit.cover),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '₹${widget.price}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.quantity = decreaseCounter(this.widget.quantity);
                        });


                      },
                      icon: Icon(Icons.remove, color: Colors.black),
                      iconSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${widget.quantity}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.quantity = increaseCounter(this.widget.quantity);

                        });
                      },
                      icon: Icon(Icons.add, color: Colors.black),
                      iconSize: 16,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // Remove item from cart logic
                },
                icon: Icon(Icons.close, color: Colors.black),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}