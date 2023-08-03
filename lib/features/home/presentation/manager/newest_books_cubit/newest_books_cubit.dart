import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_book_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);

    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(failure.messsage));
      } else {
        emit(NewestBooksPaginationFailure(failure.messsage));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
