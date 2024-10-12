import 'package:bloc/bloc.dart';
import 'package:book_store/core/api_service.dart';
import 'package:book_store/core/features/auth/cubit/auth_state.dart';
import 'package:book_store/books/data/models/tokenModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  static AuthCubit get(context) => BlocProvider.of(context);

  late TokenModel tokenModel;
  Future<void> login(
      {required String userEmail, required String password}) async {
    if (userEmail.isEmpty || password.isEmpty) {
      emit(loginErrorState("Please fill all fields"));
      return;
    }

    emit(loginLoadingState());

    try {
      final response = await Dio().post(
        'https://api.codingarabic.online/api/auth/login',
        data: {'email': userEmail, 'password': password},
      );

      if (response.statusCode == 200) {
        emit(loginSuccessState());
      } else {
        emit(loginErrorState(response.data['message'] ?? 'Login failed'));
      }
    } on DioError catch (dioError) {
      String errorMessage = 'An error occurred';
      if (dioError.type == DioErrorType.connectionTimeout) {
        errorMessage = 'Connection timeout. Please try again.';
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        errorMessage =
            'Server took too long to respond. Please try again later.';
      } else if (dioError.response?.statusCode == 401) {
        errorMessage = 'Invalid email or password.';
      }
      emit(loginErrorState(errorMessage));
    } catch (e) {
      emit(loginErrorState('An unexpected error occurred: $e'));
    }
  }

  Future<void> register(
      {required String userEmail,
      required String password,
      required String passwordConfirm,
      required String userName}) async {
    emit(registerLoadingState());
    try {
      tokenModel = await ApiService().register(
          userEmail: userEmail,
          userName: userName,
          passwordConfirm: passwordConfirm,
          password: password);
      emit(registerSuccessState());
    } catch (e) {
      emit(registerErrorState());
    }
  }
}
