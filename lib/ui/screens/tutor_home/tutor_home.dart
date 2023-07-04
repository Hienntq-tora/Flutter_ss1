import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_page.dart';
import 'package:time_tracker/ui/screens/tutor_lesson/tutor_lesson_page.dart';
import 'package:time_tracker/ui/screens/tutor_notification/tutor_notification_page.dart';
import '../../../configs/theme_manager.dart';
import '../../../l10n/locale_keys.g.dart';
import '../../../study_app_icon_icons.dart';
import '../tutor_profile/tutor_profile.dart';

class TutorHome extends StatefulWidget {
  const TutorHome({super.key, this.screen});

  final int? screen;

  @override
  State<TutorHome> createState() => _TutorHomeState();
}

class _TutorHomeState extends State<TutorHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const <Widget>[
    TutorHomePage(),
    TutorLessonPage(),
    TutorNotificationPage(),
    TutorProfile(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.screen ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          color: GeneralColors.neutral2,
          activeColor: Colors.white,
          tabBackgroundColor: Theme.of(context).primaryColor,
          tabBorderRadius: 16,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          gap: 8,
          tabs: [
            GButton(
              icon: StudyAppIcon.home,
              text: LocaleKeys.bottomNavigationHome.tr(),
            ),
            GButton(
              icon: StudyAppIcon.edit,
              text: LocaleKeys.bottomNavigationLesson.tr(),
            ),
            GButton(
              icon: StudyAppIcon.description,
              text: LocaleKeys.bottomNavigationNotification.tr(),
            ),
            GButton(
              icon: StudyAppIcon.user,
              text: LocaleKeys.bottomNavigationProfile.tr(),
            )
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
