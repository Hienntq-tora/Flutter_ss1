import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/tutor.dart';
import '../../../core/error_handling/error_object.dart';

part 'search_tutor_state.freezed.dart';

enum SearchTutorStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

@freezed
class SearchTutorBlocState with _$SearchTutorBlocState {
  const factory SearchTutorBlocState({
    required List<Tutor>? data,
    required ErrorObject? errorObject,
    required SearchTutorStatus searchTutorStatus,
  }) = _FilterTimeTrackerBlocState;

  factory SearchTutorBlocState.initial() => const SearchTutorBlocState(
        data: null,
        errorObject: null,
        searchTutorStatus: SearchTutorStatus.initial,
      );
}
