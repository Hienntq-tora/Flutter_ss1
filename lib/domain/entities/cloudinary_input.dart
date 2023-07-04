import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';

class CloudinaryInput {
  CloudinaryInput(this.file, {this.resourceType = CloudinaryResourceType.auto});

  final File file;
  final CloudinaryResourceType resourceType;
}
