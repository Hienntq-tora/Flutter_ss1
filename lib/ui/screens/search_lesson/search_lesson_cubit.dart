// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/usecases/search_lesson_usecase.dart';
import 'package:time_tracker/ui/screens/search_lesson/search_lesson_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class SearchLessonCubit extends Cubit<SearchLessonBlocState> {
  SearchLessonCubit(this._searchLessonUseCase)
      : super(SearchLessonBlocState.initial());

  final SearchLessonUseCase _searchLessonUseCase;

  void searchLesson(SearchLessonParams params) async {
    try {
      await Future.delayed(Duration.zero);
      emit(state.copyWith(searchLessonStatus: SearchLessonStatus.loading));
      final results = await _searchLessonUseCase.call(LessonUseCaseParams(
          params.teacherId,
          params.search,
          params.filter,
          params.fieldId,
          params.order,
          params.difficulty));
      results.item2.insert(0, const Field(id: "", name: "All"));
      emit(state.copyWith(
          searchLessonStatus: SearchLessonStatus.loadSuccess,
          data: results.item1,
          fields: results.item2));
    } on DomainError catch (e) {
      emit(state.copyWith(
          searchLessonStatus: SearchLessonStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}

class SearchLessonParams {
  String? teacherId;
  String? search;
  int? filter;
  String? fieldId;
  String? order;
  String? difficulty;

  SearchLessonParams({
    this.teacherId,
    this.search,
    this.filter,
    this.fieldId,
    this.order,
    this.difficulty,
  });
}
