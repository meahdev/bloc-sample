import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/core/api_end_points.dart';
import '../../domain/core/main_failures/main_failures.dart';
import '../../domain/downloads/i_downlod_repo.dart';
import '../../domain/downloads/model/downloads.dart';

class DownloadRepository implements IDownloadRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadImage() async {
    try {
      print('response url is ${ApiEndPoints.downloads}');
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        return Right(downloadList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (stackTrace, e) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
