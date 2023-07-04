import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/screens/lesson_history/student_history_provider.dart';
import 'package:time_tracker/ui/screens/search_tutor/search_tutor_page.dart';
import 'package:time_tracker/ui/screens/student_home/student_home_provider.dart';
import 'package:time_tracker/ui/screens/student_profile/student_profile.dart';

import '../../../configs/theme_manager.dart';
import '../../../study_app_icon_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    StudentHomeProvider(),
    SearchTutorPage(),
    StudentHistoryProvider(),
    StudentProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GNav(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              color: GeneralColors.neutral2,
              activeColor: Colors.white,
              tabBackgroundColor: Theme.of(context).primaryColor,
              tabBorderRadius: 16,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gap: 8,
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
              tabs: [
                GButton(
                  icon: StudyAppIcon.home,
                  text: LocaleKeys.bottomNavigationHome.tr(),
                ),
                GButton(
                  icon: StudyAppIcon.edit,
                  text: LocaleKeys.bottomNavigationTutor.tr(),
                ),
                GButton(
                  icon: StudyAppIcon.description,
                  text: LocaleKeys.bottomNavigationHistory.tr(),
                ),
                GButton(
                  icon: StudyAppIcon.user,
                  text: LocaleKeys.bottomNavigationProfile.tr(),
                )
              ]),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
