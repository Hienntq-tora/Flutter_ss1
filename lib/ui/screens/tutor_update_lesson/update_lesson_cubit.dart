import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/entities/cloudinary_input.dart';
import 'package:time_tracker/domain/entities/none.dart';
import 'package:time_tracker/domain/usecases/cloudinary_usecase.dart';
import 'package:time_tracker/domain/usecases/list_field_usecase.dart';
import 'package:time_tracker/domain/usecases/update_lesson_usecase.dart';
import 'package:time_tracker/ui/screens/tutor_update_lesson/update_lesson_bloc_state.dart';

import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';
import '../../../domain/usecases/lesson_detail_usecase.dart';
import 'components/tutor_content_tile.dart';

class UpdateLessonCubit extends Cubit<UpdateLessonBlocState> {
  UpdateLessonCubit(
    this._cloudinaryUseCase,
    this._listFieldUseCase,
    this._lessonDetailUseCase,
    this._updateLessonUseCase,
  ) : super(UpdateLessonBlocState.initial());

  final CloudinaryUseCase _cloudinaryUseCase;
  final ListFieldUseCase _listFieldUseCase;
  final LessonDetailUseCase _lessonDetailUseCase;
  final UpdateLessonUseCase _updateLessonUseCase;

  void getFieldList() async {
    try {
      emit(state.copyWith(status: UpdateLessonStatus.loading));
      final fields = await _listFieldUseCase.call(None());
      emit(state.copyWith(
        fields: fields,
        status: UpdateLessonStatus.loadFieldListSuccess,
      ));
    } on DomainError catch (e) {
      emit(
        state.copyWith(
            status: UpdateLessonStatus.loadFailure,
            errorObject: ErrorObject.mapErrorToErrorObject(error: e)),
      );
    }
  }

  void getLessonDetail({required String lessonId}) async {
    try {
      emit(state.copyWith(status: UpdateLessonStatus.loading));
      final lesson = await _lessonDetailUseCase.call(lessonId);
      emit(state.copyWith(
        lesson: lesson,
        status: UpdateLessonStatus.loadLessonSuccess,
      ));
    } on DomainError catch (e) {
      emit(
        state.copyWith(
            status: UpdateLessonStatus.loadFailure,
            errorObject: ErrorObject.mapErrorToErrorObject(error: e)),
      );
    }
  }

  void updateLesson({
    required String? lessonId,
    required File? imageFile,
    required String title,
    required String description,
    required String fieldId,
    required String difficulty,
    required String price,
    required String linkMeeting,
    required List<TutorContentModel> content,
  }) async {
    try {
      emit(state.copyWith(status: UpdateLessonStatus.loading));
      String? imageUrl;
      if (imageFile != null) {
        final cloudinaryResponse =
            await _cloudinaryUseCase.call(CloudinaryInput(
          imageFile,
          resourceType: CloudinaryResourceType.image,
        ));
        if (cloudinaryResponse.isSuccessful) {
          imageUrl = cloudinaryResponse.secureUrl;
        }
      }
      final updateLessonResponse = await _updateLessonUseCase.call(
        UpdateLessonParams(
          lessonId: lessonId,
          imageUrl: imageUrl,
          title: title,
          description: description,
          fieldId: fieldId,
          difficulty: difficulty,
          price: price,
          linkMeeting: linkMeeting,
          content: content,
        ),
      );
      emit(state.copyWith(
        updateLessonResponse: updateLessonResponse,
        status: UpdateLessonStatus.updateLessonSuccess,
      ));
    } on DomainError catch (e) {
      emit(
        state.copyWith(
            status: UpdateLessonStatus.loadFailure,
            errorObject: ErrorObject.mapErrorToErrorObject(error: e)),
      );
    }
  }
}
