import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.book});

  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kDetailsBookView, extra: book);

        // GoRouter.of(context).push(AppRouter.kDetailsBookView);
      },
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            placeholder: (context, url) =>
                const FeaturedBooksListViewLoadingIndicator(),
            imageUrl: book.image ?? AssetsData.testImage,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(
              Icons.auto_fix_off,
            ),
          ),
        ),
      ),
    );
  }
}
