import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:time_tracker/core/environment.dart';
import 'package:time_tracker/data/resources/local_data_resource.dart';
import 'package:time_tracker/domain/entities/cloudinary_input.dart';
import 'package:time_tracker/domain/repositories/cloudinary_repository.dart';

class CloudinaryRepositoryImpl extends CloudinaryRepository {
  CloudinaryRepositoryImpl(
      this.cloudinary, this.localDataResource, this.environmentManager);

  final Cloudinary cloudinary;
  final LocalDataResource localDataResource;
  final EnvironmentManager environmentManager;

  @override
  Future<CloudinaryResponse> unsignedUpload(CloudinaryInput input) async {
    final uploadPreset = await environmentManager.uploadPreset;
    return cloudinary.unsignedUploadResource(CloudinaryUploadResource(
      uploadPreset: uploadPreset,
      filePath: input.file.path,
      fileBytes: input.file.readAsBytesSync(),
      resourceType: input.resourceType,
    ));
  }
}
