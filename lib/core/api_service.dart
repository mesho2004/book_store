import 'package:book_store/core/tokenModel.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();
  login(String userEmail, String password) async {
    final response = await dio.post(
        "https://api.codingarabic.online/api/auth/login",
        data: {'email': userEmail, 'password': password});
    Map<String, dynamic> tokenData = response.data["data"];
    TokenModel tokenModel = TokenModel.fromJson(tokenData);
    return tokenModel;
  }

   register(String userEmail, String password,String passwordConfirm,String userName) async {
    final response = await dio.post(
        "https://api.codingarabic.online/api/auth/login",
        data: {'email': userEmail, 'password': password, 'passwordConfirm': passwordConfirm, 'userName': userName});
    Map<String, dynamic> tokenData = response.data["data"];
    TokenModel tokenModel = TokenModel.fromJson(tokenData);
    return tokenModel;
  }
}
