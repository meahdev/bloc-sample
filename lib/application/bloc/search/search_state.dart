part of 'search_bloc.dart';

 @freezed
 class SearchState with _$SearchState {
   const factory SearchState({
     required bool isLoading,
     required List<Downloads> idlList,
     required  List<Results> searchLIst,
     required bool isError
   }) = _SearchState;

    factory SearchState.initial(){
     return const SearchState(isLoading: false, idlList: [], searchLIst: [], isError: false);
   }
 }
