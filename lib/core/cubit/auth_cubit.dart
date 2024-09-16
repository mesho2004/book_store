import 'package:bloc/bloc.dart';
import 'package:book_store/core/api_service.dart';
import 'package:book_store/core/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(super.initialState);
  login() {
    ApiService().login("userEmail", "password");
  }
}
