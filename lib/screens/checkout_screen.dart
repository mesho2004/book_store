import 'package:book_store/screens/suceess_screen.dart';
import 'package:book_store/widgets/custom_textField.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),


      ),
      body: Column(
        children: [
          Expanded(child:
           ListView(
            children: [
               CustomTextfield(text: "Full Name"),
          SizedBox(height: 15,),
          CustomTextfield(text: "Email"),
          SizedBox(height: 15,),
          CustomTextfield(text: "Address"),
          SizedBox(height: 15,),
          CustomTextfield(text: "Phone"),
          SizedBox(height: 15,),
          CustomTextfield(text: "Note",contentInsets: EdgeInsets.symmetric(horizontal: 50,vertical: 50),),
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
               SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuceessScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color(0xFFB1975A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Submit Order",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )


            ],

           ),
           )
        ],
      ),
    );
  }
}
