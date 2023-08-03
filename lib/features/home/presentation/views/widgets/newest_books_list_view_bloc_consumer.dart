import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_error_widget.dart';
import '../../../domain/entities/book_entity.dart';
import 'newest_book_list_view.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({super.key});

  @override
  State<NewestBooksListViewBlocConsumer> createState() =>
      _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState
    extends State<NewestBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksCubitState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(buildErrorWidget(state.errorMessage));
        }
        if (state is NewestBooksFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(buildErrorWidget(state.errMessage));
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return NewestBooksListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
