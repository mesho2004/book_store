import 'package:book_store/books/data/models/tokenModel.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();
  Future <TokenModel> login({required String userEmail,required String password}) async {
    final response = await dio.post(
        "https://api.codingarabic.online/api/auth/login",
        data: {'email': userEmail, 'password': password});
    Map<String, dynamic> tokenData = response.data["data"];
    TokenModel tokenModel = TokenModel.fromJson(tokenData);
    return tokenModel;
  }

   Future <TokenModel> register({required String userEmail,required String password, required String passwordConfirm,required String userName}) async {
    final response = await dio.post(
        "https://api.codingarabic.online/api/auth/login",
        data: {'email': userEmail, 'password': password, 'passwordConfirm': passwordConfirm, 'userName': userName});
    Map<String, dynamic> tokenData = response.data["data"];
    TokenModel tokenModel = TokenModel.fromJson(tokenData);
    return tokenModel;
  }
}
