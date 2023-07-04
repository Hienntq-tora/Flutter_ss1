import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/screens/register_process/component/register_process_reason_form_field.dart';

import '../../../../configs/font_manager.dart';
import '../../../../l10n/locale_keys.g.dart';

class ProcessReason extends StatelessWidget {
  const ProcessReason({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'Certificate';
    const String decription =
        'The image of the certificate is unknown or incomplete. Please do it again';
    const String title1 = 'Video Profile';
    const String decription1 =
        'Please provide a short video introducing yourself';
    return Scaffold(
      appBar: Header(
        title: LocaleKeys.registerProcessReasonTitle.tr(),
        backPress: () => context.pop(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              LocaleKeys.registerProcessReasonHeader.tr(),
              style: getTitleTextStyle(),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProcessReasonFormField(
                            title: title,
                            decription: decription,
                          ),
                          SizedBox(height: 12.0),
                          ProcessReasonFormField(
                            title: title1,
                            decription: decription1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
