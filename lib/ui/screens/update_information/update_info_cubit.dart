import 'dart:io';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/domain/entities/cloudinary_input.dart';
import 'package:time_tracker/domain/usecases/cloudinary_usecase.dart';
import 'package:time_tracker/domain/usecases/update_information_usecase.dart';
import 'package:time_tracker/ui/screens/update_information/update_info_bloc_state.dart';
import '../../../core/error_handling/error_object.dart';
import '../../../domain/errors/domain_error.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoBlocState> {
  UpdateInfoCubit(
    this._cloudinaryUseCase,
    this._updateInformationUseCase,
  ) : super(UpdateInfoBlocState.initial());

  final CloudinaryUseCase _cloudinaryUseCase;
  final UpdateInformationUseCase _updateInformationUseCase;

  void updateInformation({
    required String firstName,
    required String lastName,
    File? imageFile,
  }) async {
    String? avatarUrl;
    try {
      emit(state.copyWith(status: UpdateInfoStatus.loading));
      if (imageFile != null) {
        final response = await _cloudinaryUseCase.call(
          CloudinaryInput(
            imageFile,
            resourceType: CloudinaryResourceType.image,
          ),
        );
        avatarUrl = response.secureUrl;
      }
      final output = await _updateInformationUseCase.call(
        UpdateInfoParams(
          firstName: firstName,
          lastName: lastName,
          avatarUrl: avatarUrl,
        ),
      );
      emit(state.copyWith(
        status: UpdateInfoStatus.updateInfoSuccess,
        updateInfoOutput: output,
      ));
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: UpdateInfoStatus.loadFailure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }
}
