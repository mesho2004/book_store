import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  void addToCart(Map<String, dynamic> book) {
    final updatedCart = List<Map<String, dynamic>>.from(state);
    
   
    final bookWithNumericPrice = {
      ...book,
      'price': double.tryParse(book['price'].toString()) ?? 0.0,
    };

    updatedCart.add(bookWithNumericPrice);
    emit(updatedCart); 
  }

  
  double getTotalPrice() {
    return state.fold(0, (sum, book) {
      return sum + (book['price'] ?? 0.0);
    });
  }
}
