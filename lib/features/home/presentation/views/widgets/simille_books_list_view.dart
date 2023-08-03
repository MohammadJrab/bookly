import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class SimillerBooksListView extends StatelessWidget {
  const SimillerBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              book: books[index],
            ),
          );
        },
      ),
    );
  }
}
