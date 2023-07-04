import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/divider/shadow_divider.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/components/tiles/student_tutor_available_time/header/student_tutor_available_time_list_header.dart';
import 'package:time_tracker/ui/components/tiles/student_tutor_available_time/select_reservable_date_model.dart';
import 'package:time_tracker/ui/components/tiles/student_tutor_available_time/select_reservable_date_list_tile.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/create_booking_bloc_state.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/create_booking_cubit.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/student_tutor_available_time_params.dart';

class StudentTutorAvailableTimePage extends StatefulWidget {
  const StudentTutorAvailableTimePage({
    super.key,
    required this.params,
  });

  final StudentTutorAvailableTimeParams params;

  @override
  State<StudentTutorAvailableTimePage> createState() =>
      _StudentTutorAvailableTimePageState();
}

class _StudentTutorAvailableTimePageState
    extends State<StudentTutorAvailableTimePage> {
  var cubit = di.sl<CreateBookingCubit>();
  var _availableTimeList = <ReservableDateGroupModel>[];
  var _selectedReservableDate = ReservableDateItemModel();

  void _goToStudentConfirmPayment({required String? paymentId}) {
  }

  void _selectTimeSlot(int sectionIndex, int itemIndex) {
    final item = _availableTimeList[sectionIndex].itemList[itemIndex];
    setState(() {
      _selectedReservableDate = item;
    });
  }

  List<ReservableDateGroupModel> _convertToListModel(
      List<ReservableDate> dataList) {
    final List<ReservableDateGroupModel> result = [];
    final availableReservaDates =
        dataList.where((e) => !(e.isReservated ?? true));
    final dates = availableReservaDates
        .map((e) => e.datetime)
        .whereType<String>()
        .toSet();

    for (final date in dates) {
      var group = ReservableDateGroupModel(date: date, itemList: []);
      for (final reservableDate in availableReservaDates) {
        if (date == reservableDate.datetime) {
          group.itemList.add(
            ReservableDateItemModel(
              timeSlot: reservableDate.timeString,
              id: reservableDate.id,
            ),
          );
        }
      }
      result.add(group);
    }

    return result;
  }

  List<Widget> _buildList(List<ReservableDate>? reservableDateList) {
    List<Widget> slivers = [];

    if (reservableDateList != null) {
      _availableTimeList = _convertToListModel(reservableDateList);

      for (var sectionIndex = 0;
          sectionIndex < _availableTimeList.length;
          sectionIndex++) {
        final group = _availableTimeList[sectionIndex];

        slivers.add(
          StudentTutorAvailableTimeHeader(text: "${group.date}"),
        );
        slivers.add(
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: group.itemList.length,
                (context, itemIndex) => SelectReservableDateListTile(
                  model: group.itemList[itemIndex],
                  state: (_selectedReservableDate.id ==
                          group.itemList[itemIndex].id)
                      ? TutorAvailableTimeTileState.selected
                      : TutorAvailableTimeTileState.initial,
                  onTap: () => _selectTimeSlot(sectionIndex, itemIndex),
                ),
              ),
            ),
          ),
        );
      }

      final emptyWidget = SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.studentTutorAvailableTimeNoData.tr(),
            style: getBody2TextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
      );

      if (slivers.isEmpty) slivers.add(emptyWidget);
    }

    return slivers;
  }

  void _onSelectTimePressed(BuildContext context) {
    if (_selectedReservableDate.id != null) {
      cubit.createBooking(
        lessonId: widget.params.lessonId,
        reservableDateId: _selectedReservableDate.id ?? "",
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            LocaleKeys.studentTutorAvailableTimeSnackBar.tr(),
            style: getBody2TextStyle(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateBookingCubit>(
      create: (context) =>
          cubit..getReservableDates(tutorId: widget.params.tutorId),
      child: BlocConsumer<CreateBookingCubit, CreateBookingBlocState>(
        listener: (context, state) {
          if (state.status == CreateBookingStatus.createBookingSuccess) {
            _goToStudentConfirmPayment(
                paymentId: state.createBookingOutput?.payment);
          }

          if (state.status == CreateBookingStatus.loadFailure) {
            ErrorHandler.showError(context, state.errorObject!);
          }
        },
        builder: (context, state) {
          return LoadingContainer(
            isLoading: state.status == CreateBookingStatus.loading,
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Header(
                      title: LocaleKeys.studentTutorAvailableTimeAppBar.tr(),
                      backPress: () => context.pop(),
                    ),
                    Expanded(
                      child: CustomScrollView(
                        slivers: _buildList(state.reservableDateList),
                      ),
                    ),
                    const ShadowDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 30),
                      child: Button(
                        text: LocaleKeys.studentTutorAvailableTimeSubmit.tr(),
                        onPressed: () => _onSelectTimePressed(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
