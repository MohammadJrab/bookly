part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksCubitState {}

class NewestBooksInitial extends NewestBooksCubitState {}

class NewestBooksLoading extends NewestBooksCubitState {}

class NewestBooksSuccess extends NewestBooksCubitState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksCubitState {
  final String errMessage;

  NewestBooksFailure(this.errMessage);
}
