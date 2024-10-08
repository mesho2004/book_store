import 'package:flutter/material.dart';

class CustomFavoriteCard extends StatelessWidget {
   CustomFavoriteCard({required this.title,required this.image,required this.onPressedF,required this.price});
  String title;
  String image;
  String price;
  Function() onPressedF;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFB89D68), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: onPressedF,
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),




                  ],

                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  // Handle delete action
                },
                color: Colors.black54,
              ),



            ],

          ),
        ),


        ),
    );
  }
}
