import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:time_tracker/domain/entities/cloudinary_input.dart';
import 'package:time_tracker/domain/repositories/cloudinary_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class CloudinaryUseCase extends UseCase<CloudinaryResponse, CloudinaryInput> {
  CloudinaryUseCase(this.repository);

  final CloudinaryRepository repository;

  @override
  Future<CloudinaryResponse> call(CloudinaryInput params) async {
    return repository.unsignedUpload(params);
  }
}
