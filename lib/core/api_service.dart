import 'package:dio/dio.dart';

class ApiService {
 Dio dio=Dio();
 PostData() async{
   Response response = await dio.post(
     "https://api.codingarabic.online/api/auth/login",
         data: {

       "email": "mostafa@eraasoft.com",
       "password": "12345678"
   },
   );
   dynamic jsonData = response.data;
   Map<String,dynamic> data = jsonData["data"];
   String token = data["token"];
   String token_type=data["token_type"];


 }






}
