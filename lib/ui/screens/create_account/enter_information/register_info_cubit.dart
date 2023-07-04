import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/base/errors/cloudinary_error.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/entities/cloudinary_input.dart';
import 'package:time_tracker/domain/errors/domain_error.dart';
import 'package:time_tracker/domain/usecases/cloudinary_usecase.dart';
import 'package:time_tracker/domain/usecases/register_info_usecase.dart';
import 'package:time_tracker/ui/screens/create_account/enter_information/register_info_bloc_state.dart';

class RegisterInfoCubit extends Cubit<RegisterInfoBlocState>
    with ChangeNotifier {
  RegisterInfoCubit(
    this._registerInfoUseCase,
    this._cloudinaryUseCase,
  ) : super(RegisterInfoBlocState.initial());

  final RegisterInfoUseCase _registerInfoUseCase;
  final CloudinaryUseCase _cloudinaryUseCase;

  void register(String firstName, String lastName, String email,
      String password, String? avatar, int role) async {
    try {
      emit(state.copyWith(status: RegisterInfoStatus.loading));
      final registerInfoOutput = await _registerInfoUseCase.call(
        RegisterInfoUseCaseParams(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          avatar: avatar,
          role: role,
        ),
      );
      emit(state.copyWith(
        registerInfoOutput: registerInfoOutput,
        status: RegisterInfoStatus.registerInfoSuccess,
      ));
      notifyListeners();
    } on DomainError catch (e) {
      emit(state.copyWith(
          status: RegisterInfoStatus.failure,
          errorObject: ErrorObject.mapErrorToErrorObject(error: e)));
    }
  }

  void unsignedUpload(
      {required File file, resourceType = CloudinaryResourceType.auto}) async {
    try {
      emit(state.copyWith(status: RegisterInfoStatus.loading));
      final response = await _cloudinaryUseCase.call(CloudinaryInput(
        file,
        resourceType: resourceType,
      ));

      if (response.isSuccessful && response.secureUrl!.isNotEmpty) {
        emit(state.copyWith(
          cloudinaryResponse: response,
          status: RegisterInfoStatus.unsignedUploadSuccess,
        ));
        notifyListeners();
      } else {
        throw Exception(response.error);
      }
    } catch (e) {
      final cloudinaryError = CloudinaryError(message: e.toString());

      emit(state.copyWith(
          status: RegisterInfoStatus.failure,
          errorObject:
              ErrorObject.mapErrorToErrorObject(error: cloudinaryError)));
    }
  }
}
