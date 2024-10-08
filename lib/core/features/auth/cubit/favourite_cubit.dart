import 'package:bloc/bloc.dart';

class FavoritesCubit extends Cubit<List<Map<String, dynamic>>> {
  FavoritesCubit() : super([]);

  void addToFavorites(Map<String, dynamic> book) {
    final currentFavorites = List<Map<String, dynamic>>.from(state);
    if (!currentFavorites.any((element) => element['id'] == book['id'])) {
      currentFavorites.add(book);
      emit(currentFavorites); 
    }
  }

  void removeFromFavorites(Map<String, dynamic> book) {
    final currentFavorites = List<Map<String, dynamic>>.from(state);
    currentFavorites.removeWhere((element) => element['id'] == book['id']);
    emit(currentFavorites);
  }
}
