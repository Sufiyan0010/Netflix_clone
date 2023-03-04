import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/search/model/search_responce/search_responce.dart';

abstract class SerachService {
  Future<Either<MainFailure, SearchResponce>> searchMovies({
    required String movieQuery,
  });
}
