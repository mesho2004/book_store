import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_books_cubit_state.dart';

class AllBooksCubitCubit extends Cubit<AllBooksCubitState> {
  AllBooksCubitCubit() : super(AllBooksCubitInitial());
}
