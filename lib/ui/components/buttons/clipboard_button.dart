import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';

class ClipBoardButton extends StatelessWidget {
  const ClipBoardButton({
    super.key,
    this.text,
  });

  final String? text;

  Future<void> _copyToClipBoard(
      ScaffoldMessengerState scaffoldMessengerState) async {
    await Clipboard.setData(ClipboardData(text: text ?? ""));
    scaffoldMessengerState.showSnackBar(
      SnackBar(content: Text(LocaleKeys.copyToClipBoard.tr())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 32,
      child: IconButton(
        onPressed: () async => _copyToClipBoard(ScaffoldMessenger.of(context)),
        splashRadius: 16,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          IconManager.clipboardText,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
