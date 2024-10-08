part of 'all_books_cubit_cubit.dart';

@immutable
sealed class AllBooksCubitState {}

final class AllBooksCubitInitial extends AllBooksCubitState {}
final class AllBooksCubitLoading extends AllBooksCubitState {}
final class AllBooksCubitSucess extends AllBooksCubitState {}
final class AllBooksCubitError extends AllBooksCubitState {}

