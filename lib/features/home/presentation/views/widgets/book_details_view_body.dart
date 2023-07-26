import 'package:bookly/features/home/presentation/views/widgets/similler_book_section.dart';
import 'package:flutter/material.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  CustomDetialsAppBar(),
                  BookDetialsSection(),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SimillerBookSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
