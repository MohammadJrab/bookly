import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_book_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubitCubit(this.fetchNewestBooksUseCase)
      : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();

    result.fold((failure) {
      emit(NewestBooksFailure(failure.messsage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
