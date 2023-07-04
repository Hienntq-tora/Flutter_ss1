// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/screens/register_process/component/register_process_form_field.dart';

import '../../../configs/icon_manager.dart';

class RegisterProcess extends StatefulWidget {
  const RegisterProcess({super.key});

  @override
  State<RegisterProcess> createState() => _RegisterProcessState();
}

late final String imageUrl;

class _RegisterProcessState extends State<RegisterProcess> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: LocaleKeys.registerProcessTitle.tr(),
        backPress: () => context.pop(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => RegisterProcessUI(
                      isBlocked: RegisterProcessData.data[index].isBlocked,
                      isReason: RegisterProcessData.data[index].isReason,
                      decription: RegisterProcessData.data[index].description,
                      title: RegisterProcessData.data[index].title,
                    ),
                    separatorBuilder: (context, index) =>
                        SvgPicture.asset(IconManager.suffix),
                    itemCount: RegisterProcessData.data.length,
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 48,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Start"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterProcessData {
  String title;
  String description;
  bool isBlocked;
  bool isReason;
  RegisterProcessData({
    required this.title,
    required this.description,
    required this.isBlocked,
    required this.isReason,
  });

  static List<RegisterProcessData> data = [
    RegisterProcessData(
        title: 'Register Infomation',
        description: 'Successful account registration',
        isBlocked: false,
        isReason: false),
    RegisterProcessData(
        title: 'Verify Account',
        description: 'Verify your account based on what you provided',
        isBlocked: false,
        isReason: true),
    RegisterProcessData(
        title: 'Verify Successful',
        description: 'Successful authentication. You can login to the system',
        isBlocked: true,
        isReason: false),
  ];
}
