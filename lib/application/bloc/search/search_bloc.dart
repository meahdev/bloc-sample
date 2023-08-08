import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/main_failures/main_failures.dart';
import '../../../domain/downloads/model/downloads.dart';
import '../../../domain/search/model/Results.dart';
import '../../../infrastructure/dowonloads/download_repository.dart';
import '../../../infrastructure/search/search_repository.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepository searchRepository;
  DownloadRepository downloadRepository;

  SearchBloc(this.searchRepository, this.downloadRepository)
      : super(SearchState.initial()) {
    on<_Initialize>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      await Future.delayed(const Duration(seconds: 3));
      final Either<MainFailures, List<Downloads>> result =
          await downloadRepository.getDownloadImage();
      final data = result.fold(
          (failure) => state.copyWith(
              isLoading: false, idlList: [], searchLIst: [], isError: true),
          (success) => state.copyWith(
              isLoading: false,
              isError: false,
              searchLIst: [],
              idlList: success));
      emit(data);
    });
  }
}
