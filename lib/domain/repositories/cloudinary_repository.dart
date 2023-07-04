import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:time_tracker/domain/entities/cloudinary_input.dart';

abstract class CloudinaryRepository {
  Future<CloudinaryResponse> unsignedUpload(CloudinaryInput input);
}
