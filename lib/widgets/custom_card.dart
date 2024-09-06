import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   CustomCard({required this.image,required this.title,required this.onPressedFunction});
  String image;
  String title;
  Function() onPressedFunction;


   @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(image,),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹285",
                  style: TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: onPressedFunction,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), backgroundColor: Colors.black,
                  ),
                  child: Text("Buy",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ],
      ),
    );;
  }
}
