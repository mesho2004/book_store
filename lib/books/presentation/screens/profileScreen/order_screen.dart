import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My Orders',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            OrderCard(
              orderNumber: "238562312",
              date: "20/03/2020",
              totalAmount: "\$150",
            ),
            // Add more OrderCard widgets here as needed
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String totalAmount;

  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order No$orderNumber",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              "Total Amount: $totalAmount",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
