import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/data/resources/enums/user_role.dart';
import 'package:time_tracker/domain/entities/user_role_selection.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/tiles/selection_list_tile.dart';

import '../../../components/header/header.dart';

class CreateAccountSelectRolePage extends StatefulWidget {
  const CreateAccountSelectRolePage({super.key});

  @override
  State<CreateAccountSelectRolePage> createState() =>
      _CreateAccountSelectRolePageState();
}

class _CreateAccountSelectRolePageState
    extends State<CreateAccountSelectRolePage> {
  List<UserRoleSelection> roleSelectionList = [
    UserRoleSelection(role: UserRole.student, isSelected: false),
    UserRoleSelection(role: UserRole.tutor, isSelected: true),
  ];

  UserRole get selectedRole {
    return roleSelectionList.firstWhere((element) => element.isSelected).role;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: LocaleKeys.createAccountAppBarTitle.tr(),
        backPress: () {
          Navigator.of(context).pop();
        },
      ),
      floatingActionButton: SizedBox(
        width: 165,
        height: 49,
        child: Button(
          text: LocaleKeys.createAccountSelectRoleFAB.tr(),
          onPressed: () => context.push(
            AppPage.createAccountEnterInfo.toPath,
            extra: selectedRole,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 65),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: Text(
                  LocaleKeys.createAccountSelectRoleHeader.tr(),
                  style: getHeadline1TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 35.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      UserRoleSelection roleSelection =
                          roleSelectionList[index];

                      return SelectionListTile(
                        isSelected: roleSelection.isSelected,
                        onTap: () {
                          setState(() {
                            for (final element in roleSelectionList) {
                              element.isSelected = false;
                            }
                            roleSelection.isSelected = true;
                          });
                        },
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Image.asset(
                                roleSelection.role.imageAsset ?? ""),
                          ),
                        ),
                        center: Text(
                          roleSelection.role.name,
                          style: getHeadline2TextStyle(),
                        ),
                        trailingIcon: Image.asset(IconManager.tickEmpty),
                        selectedTrailingIcon:
                            Image.asset(IconManager.tickFilled),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16.0);
                    },
                    itemCount: roleSelectionList.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
