// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/usecases/search_tutor_usecase.dart';
import 'package:time_tracker/ui/screens/search_tutor/search_tutor_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class SearchTutorCubit extends Cubit<SearchTutorBlocState> {
  SearchTutorCubit(this._searchTutorUseCase)
      : super(SearchTutorBlocState.initial());

  final SearchTutorUseCase _searchTutorUseCase;

  void searchTutor(SearchTutorParams params) async {
    try {
      await Future.delayed(Duration.zero);
      emit(state.copyWith(searchTutorStatus: SearchTutorStatus.loading));
      final results = await _searchTutorUseCase
          .call(SearchTutorUseCaseParams(params.search));
      emit(state.copyWith(
          searchTutorStatus: SearchTutorStatus.loadSuccess, data: results));
    } on DomainError catch (e) {
      emit(state.copyWith(
          searchTutorStatus: SearchTutorStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}

class SearchTutorParams {
  String? search;
  SearchTutorParams({
    this.search,
  });
}
