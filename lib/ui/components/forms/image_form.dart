import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/dialogs/options_dialog.dart';
import 'package:time_tracker/ui/components/image_loader/image_loader.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';

import '../buttons/square_button.dart';

typedef ImageFormValidator = String? Function(File? imageFile);

class ImageForm extends StatefulWidget {
  const ImageForm({
    super.key,
    this.onCompleted,
    this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius,
    this.imagePadding = EdgeInsets.zero,
    this.placeholderImage,
    this.validator,
  });

  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final Function(File file)? onCompleted;
  final String? imageUrl;
  final EdgeInsets imagePadding;
  final Widget? placeholderImage;
  final ImageFormValidator? validator;

  @override
  State<ImageForm> createState() => ImageFormState();
}

class ImageFormState extends State<ImageForm> {
  File? _imageFile;
  bool _isRequestingPermission = false;
  String? _errorMessage;

  Future<void> _onPressed() async {
    if (await _requestPermission()) {
      _showOptionsDialog();
    }
  }

  Future<bool> _requestPermission() async {
    if (_isRequestingPermission) return false;
    _isRequestingPermission = true;

    Map<Permission, PermissionStatus> statuses;

    if (Platform.isAndroid) {
      DeviceInfoPlugin plugin = DeviceInfoPlugin();
      AndroidDeviceInfo android = await plugin.androidInfo;

      // Check if device is Android 12 or lower.
      if (android.version.sdkInt < 33) {
        statuses = await [
          Permission.camera,
          Permission.storage,
        ].request();
      } else {
        statuses = await [
          Permission.camera,
          Permission.photos,
          Permission.videos,
        ].request();
      }
    } else {
      statuses = await [
        Permission.camera,
        Permission.storage,
      ].request();
    }

    _isRequestingPermission = false;
    return statuses.entries.every((element) => element.value.isGranted);
  }

  void _showOptionsDialog() {
    List<ImageSource> optionList = [ImageSource.camera, ImageSource.gallery];

    final optionDialog = OptionsDialog(
      optionList: optionList.map((option) {
        switch (option) {
          case ImageSource.camera:
            return LocaleKeys.mediaPickerCameraSource.tr();
          case ImageSource.gallery:
            return LocaleKeys.mediaPickerGallerySource.tr();
        }
      }).toList(),
      title: Text(LocaleKeys.avatarOptionsDialogTitle.tr()),
      onOptionTap: (index) {
        _selectImage(optionList[index]);
      },
    );

    optionDialog.show(context);
  }

  Future<void> _selectImage(ImageSource source) async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        final CroppedFile? croppedImage = await _cropImage(pickedImage.path);

        final pickedFile = File(croppedImage?.path ?? pickedImage.path);

        final errorMessage = SupportValidators.file(
          10,
          FileCapacityUnit.mb,
          fieldName: "",
          errorText: LocaleKeys.validationMaxFileSize.tr(),
        ).call(pickedFile);

        if (errorMessage != null) {
          throw Exception(errorMessage);
        } else {
          setState(() {
            _imageFile = pickedFile;
            widget.onCompleted?.call(pickedFile);
          });
        }
      }
    } catch (e) {
      ErrorHandler.showLocalError(
          context, LocaleKeys.failDialogTitle.tr(), e.toString());
    }
  }

  Future<CroppedFile?> _cropImage(String sourcePath) async {
    return ImageCropper().cropImage(
      sourcePath: sourcePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: LocaleKeys.imageCropperTitle.tr(),
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: LocaleKeys.imageCropperTitle.tr(),
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
  }

  bool validate() {
    setState(() {
      _errorMessage = widget.validator?.call(_imageFile);
    });
    return _errorMessage == null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget imageWidget =
        widget.placeholderImage ?? SvgPicture.asset(IconManager.avatar);

    if (widget.imageUrl != null) {
      imageWidget = ImageLoader(
        imageUrl: widget.imageUrl!,
        width: widget.width,
        height: widget.height,
      );
    }
    if (_imageFile != null) {
      imageWidget = Image.file(_imageFile!, fit: BoxFit.cover);
    }

    return SizedBox(
      width: widget.width + widget.imagePadding.horizontal,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              GestureDetector(
                onTap: _onPressed,
                child: Padding(
                  padding: widget.imagePadding,
                  child: SizedBox(
                    width: widget.width,
                    height: widget.height,
                    child: ClipRRect(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(16.0),
                      child: imageWidget,
                    ),
                  ),
                ),
              ),
              SquareButton(
                color: theme.colorScheme.secondary,
                dimension: 40,
                shape: const CircleBorder(),
                onPressed: _onPressed,
                icon: const Icon(Icons.camera_alt_rounded),
              ),
            ],
          ),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                _errorMessage!,
                style: getCaptionTextStyle().copyWith(
                  fontWeight: FontWeight.normal,
                  color: theme.colorScheme.error,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
