import 'package:dartz/dartz.dart';

import '../core/main_failures/main_failures.dart';
import 'model/SearchResponse.dart';

abstract class ISearchRepo {
  Future<Either<MainFailures, SearchResponse>> getSearch(
      {required String searchQuery});
}
