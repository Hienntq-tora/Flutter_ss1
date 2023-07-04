import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/card/tutor_notification_card.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/tutor_notification/tutor_notification_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_notification/tutor_notification_cubit.dart';

class TutorNotificationPage extends StatefulWidget {
  const TutorNotificationPage({super.key});

  @override
  State<TutorNotificationPage> createState() => _TutorNotificationPageState();
}

class _TutorNotificationPageState extends State<TutorNotificationPage> {
  var cubit = di.sl<TutorNotificationCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TutorNotificationCubit>(
      create: (context) => cubit..getTutorNotification(),
      child: BlocConsumer<TutorNotificationCubit, TutorNotificationBlocState>(
          listener: (context, state) {
        if (state.tutorNotificationStatus ==
            TutorNotificationStatus.loadSuccess) {
          cubit.readAllNotification();
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: const Header(title: "Notification"),
          resizeToAvoidBottomInset: false,
          body: LoadingContainer(
            isLoading: state.tutorNotificationStatus ==
                TutorNotificationStatus.loading,
            child: SafeArea(
              child: (state.data == null)
                  ? const Center()
                  : ((state.data?.length ?? 0) > 0)
                      ? ListView.separated(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return TutorNotificationCard(
                              notification: state.data?[index],
                              onPressed: () {},
                            );
                          },
                          separatorBuilder: (context, index) => const Divider())
                      : Center(child: Text(LocaleKeys.noData.tr())),
            ),
          ),
        );
      }),
    );
  }
}
