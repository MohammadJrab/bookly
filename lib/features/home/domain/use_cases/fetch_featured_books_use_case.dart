import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_failure.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([param]) {
    return homeRepo.fetchFeaturedBooks();
  }
}
