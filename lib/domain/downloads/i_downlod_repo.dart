import 'package:dartz/dartz.dart';

import '../core/main_failures/main_failures.dart';
import 'model/downloads.dart';

abstract class IDownloadRepo {
  Future<Either<MainFailures, List<Downloads>>> getDownloadImage();
}
