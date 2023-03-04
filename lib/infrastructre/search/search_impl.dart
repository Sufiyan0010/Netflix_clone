import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/search/model/search_responce/search_responce.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: SerachService)
class SearchImpl implements SerachService {
  @override
  Future<Either<MainFailure, SearchResponce>> searchMovies({
    required String movieQuery,
  }) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {'query': movieQuery},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponce.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
