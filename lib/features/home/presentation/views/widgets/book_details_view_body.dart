import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/similler_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomDetialsAppBar(),
                  BookDetialsSection(book: book),
                  const Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  BlocBuilder<NewestBooksCubit, NewestBooksCubitState>(
                    builder: (context, state) {
                      if (state is NewestBooksSuccess) {
                        return SimillerBookSection(books: state.books);
                      } else {
                        return const CustomLoadingIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
