part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksCubitState {}

class NewestBooksInitial extends NewestBooksCubitState {}

class NewestBooksLoading extends NewestBooksCubitState {}

class NewestBooksSuccess extends NewestBooksCubitState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksPaginationLoading extends NewestBooksCubitState {}

class NewestBooksPaginationFailure extends NewestBooksCubitState {
  final String errorMessage;

  NewestBooksPaginationFailure(this.errorMessage);
}

class NewestBooksFailure extends NewestBooksCubitState {
  final String errMessage;

  NewestBooksFailure(this.errMessage);
}
