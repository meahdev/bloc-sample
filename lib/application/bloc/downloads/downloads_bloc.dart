import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/main_failures/main_failures.dart';
import '../../../domain/downloads/i_downlod_repo.dart';
import '../../../domain/downloads/model/downloads.dart';

part 'downloads_bloc.freezed.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';

@Injectable()
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  IDownloadRepo iDownloadRepo;

  DownloadsBloc(this.iDownloadRepo) : super(DownloadsState.initial()) {
    on<GetDownloadImage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        downloadFailureOrSuccess: none(),
      ));
      await Future.delayed(const Duration(seconds: 3));
      final Either<MainFailures, List<Downloads>> downloadOption =
          await iDownloadRepo.getDownloadImage();

      emit(
        downloadOption.fold(
            (failure) => state.copyWith(
                isLoading: false,
                downloadFailureOrSuccess: Some(Left(failure))),
            (success) => state.copyWith(
                isLoading: false,
                downloads: success,
                downloadFailureOrSuccess: Some(Right(success)))),
      );
    });
  }
}
