import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/core/api_end_points.dart';
import '../../domain/core/main_failures/main_failures.dart';
import '../../domain/search/i_search_repo.dart';
import '../../domain/search/model/SearchResponse.dart';

class SearchRepository implements ISearchRepo {
  @override
  Future<Either<MainFailures, SearchResponse>> getSearch(
      {required String searchQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {"query": searchQuery});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result =
            SearchResponse.fromJson(response.data as Map<String, dynamic>);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
