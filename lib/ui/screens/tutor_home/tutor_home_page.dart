import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/square_button.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/filter_appointment/filter_appointment/filter_appointment_bottom_sheet.dart.dart';
import 'package:time_tracker/ui/screens/tutor_appointment/tutor_appointment_page.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/screens/tutor_available_time/tutor_available_time.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_cubit.dart';
import '../filter_appointment/filter_appointment/filter_time_slots.dart';

class TutorHomePage extends StatefulWidget {
  const TutorHomePage({super.key});

  @override
  State<TutorHomePage> createState() => _TutorHomePageState();
}

class _TutorHomePageState extends State<TutorHomePage>
    with SingleTickerProviderStateMixin {
  var _selectedIndex = 0;

  final cubit = di.sl<TutorHomeCubit>();
  final List<Field> timeSlots =
      TimeSlot.timeList.map((e) => Field(id: e, name: e)).toList();
  var _filterParams = FilterAppointmentModel();
  Field? _startTime;
  Field? _endTime;
  late TabController _tabController;

  final _tabs = [
    Tab(text: LocaleKeys.tutorHomeTab1.tr()),
    Tab(text: LocaleKeys.tutorHomeTab2.tr()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    _startTime = timeSlots.cast<Field?>().firstWhere(
          (element) => _filterParams.startTime == element?.id,
          orElse: () => null,
        );
    _endTime = timeSlots.cast<Field?>().firstWhere(
          (element) => _filterParams.endTime == element?.id,
          orElse: () => null,
        );

    final filterBottomSheet = FilterAppointmentBottomSheet(
      startDate: _filterParams.startDate,
      endDate: _filterParams.endDate,
      startTime: _startTime,
      endTime: _endTime,
      items: timeSlots,
      showRadioList: _selectedIndex == 1,
      bookingStatus: _filterParams.bookingStatus,
      onFilterSuccess: (filterParams) {
        _filterParams = filterParams;
        cubit.getTutorHomeLists(filterParams);
      },
    );
    filterBottomSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => cubit..getTutorHomeLists(_filterParams),
        child: BlocConsumer<TutorHomeCubit, TutorHomeBlocState>(
          listener: (context, state) {
            if (state.status == TutorHomeStatus.reload) {
              cubit.getTutorHomeLists(_filterParams);
            }

            if (state.status == TutorHomeStatus.loadFailure) {
              ErrorHandler.showError(context, state.errorObject!);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: Header(
                title: LocaleKeys.tutorHomeTitle.tr(),
                color: theme.scaffoldBackgroundColor,
                trailing: SquareButton(
                  icon: SvgPicture.asset(
                    IconManager.sort,
                    colorFilter: ColorFilter.mode(
                      theme.textTheme.bodyMedium?.color ?? Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  color: theme.scaffoldBackgroundColor,
                  onPressed: _showFilterBottomSheet,
                  splashColor: theme.dividerColor,
                ),
              ),
              body: LoadingContainer(
                isLoading: state.status == TutorHomeStatus.loading,
                child: Column(
                  children: [
                    Material(
                      color: theme.scaffoldBackgroundColor,
                      child: TabBar(
                        tabs: _tabs,
                        controller: _tabController,
                        indicatorColor: theme.primaryColor,
                        labelColor: theme.primaryColor,
                        labelStyle: getBody1TextStyle(),
                        unselectedLabelStyle: getBody2TextStyle(),
                        onTap: (value) => _selectedIndex = value,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ClipRect(
                            clipBehavior: Clip.antiAlias,
                            child: TutorAppointmentPage(
                              appointments: state.appointments,
                            ),
                          ),
                          ClipRect(
                            clipBehavior: Clip.antiAlias,
                            child: TutorAvailableTimePage(
                              reservableDates: state.reservableDates,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
