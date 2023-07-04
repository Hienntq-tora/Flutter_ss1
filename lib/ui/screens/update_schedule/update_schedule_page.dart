import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/domain/enums/date_formats.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/dialogs/confirm_dialog.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/filter_appointment/filter_appointment/filter_time_slots.dart';
import 'package:time_tracker/ui/screens/update_schedule/update_schedule_bloc_state.dart';
import 'package:time_tracker/ui/screens/update_schedule/update_schedule_cubit.dart';
import 'package:time_tracker/ui/screens/update_schedule/update_schedule_model.dart';
import 'package:time_tracker/utils/util.dart';
import 'package:time_tracker/core/services/injection.dart' as di;

import '../../../domain/entities/reservable_date.dart';
import '../../components/chip/reservable_date_chip.dart';

class UpdateSchedulePage extends StatefulWidget {
  const UpdateSchedulePage({super.key, this.initialDate});

  final String? initialDate;

  @override
  State<UpdateSchedulePage> createState() => _UpdateSchedulePageState();
}

class _UpdateSchedulePageState extends State<UpdateSchedulePage> {
  final cubit = di.sl<UpdateScheduleCubit>();
  List<UpdateScheduleModel> _dataSource = [];
  DateTime? _selectedDate;

  String get _selectedDateStr {
    return _selectedDate.parseToString(DateFormats.serverDate) ?? "";
  }

  void _selectTimeSlot(int index) {
    setState(() {
      _dataSource[index].toggleSelection();
    });
  }

  void _deleteTimeSlots(BuildContext context) {
    final confirmDialog = ConfirmDialog(
      message: LocaleKeys.confirmDeleteScheduleMsg.tr(),
      submitText: LocaleKeys.confirmDeleteScheduleSubmit.tr(),
      cancelText: LocaleKeys.confirmDeleteScheduleClose.tr(),
      onSubmit: () => cubit.deleteReservableDate(_selectedDateStr),
    );
    confirmDialog.show(context);
  }

  void _updateList(List<ReservableDate>? list) {
    _clearList();
    if (list != null && list.isNotEmpty) {
      for (final reservableDate in list) {
        final matchedIndex = _dataSource.indexWhere(
          (model) => model.timeSlot.timeId == reservableDate.timeId,
        );
        if (matchedIndex != -1) {
          _dataSource[matchedIndex].isReservated =
              reservableDate.isReservated ?? false;
          _dataSource[matchedIndex].isSelected = true;
        }
      }
    }

    setState(() {});
  }

  void _clearList() {
    _dataSource = _dataSource
        .map((model) => model.copyWith(
              isReservated: false,
              isSelected: false,
            ))
        .toList();
  }

  void _updateSchedule() {
    final selectedIds = _dataSource
        .where((element) => element.status == UpdateScheduleStatusEnum.selected)
        .map((e) => e.timeSlot.timeId)
        .toList();
    cubit.updateReservableDate(
      dateTime: _selectedDateStr,
      timeIds: selectedIds,
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate.parseToDate(DateFormats.serverDate);
    _dataSource = TimeSlot.timeSlotList.map((timeSlot) {
      return UpdateScheduleModel(timeSlot: timeSlot);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider<UpdateScheduleCubit>(
      create: (context) => cubit..getScheduleList(_selectedDateStr),
      child: BlocConsumer<UpdateScheduleCubit, UpdateScheduleBlocState>(
          listener: (context, state) {
        if (state.status == UpdateScheduleStatus.loadSuccess) {
          _updateList(state.reservableDates);
        }

        if (state.status == UpdateScheduleStatus.updateSuccess) {
          final finishDialog = ConfirmDialog(
            message: LocaleKeys.updateScheduleSuccessMsg.tr(),
            submitText: LocaleKeys.updateScheduleSuccessClose.tr(),
            onSubmit: () => _updateList(state.reservableDates),
          );
          finishDialog.show(context);
        }

        if (state.status == UpdateScheduleStatus.deleteSuccess) {
          setState(() {
            _clearList();
          });
        }

        if (state.status == UpdateScheduleStatus.loadFailure) {
          ErrorHandler.showError(context, state.errorObject!);
        }
      }, builder: (context, state) {
        return LoadingContainer(
          isLoading: state.status == UpdateScheduleStatus.loading,
          child: Scaffold(
            appBar: Header(
              title: LocaleKeys.updateScheduleTitle.tr(),
              backPress: () {
                context.pop("need_reload_page");
              },
              trailing: state.reservableDates.isEmptyOrNull
                  ? null
                  : IconButton(
                      icon: SvgPicture.asset(
                        IconManager.trash,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          theme.colorScheme.error,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () => _deleteTimeSlots(context),
                    ),
            ),
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(24),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: CalendarDatePicker(
                            initialDate: _selectedDate ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            onDateChanged: (dateTime) {
                              _selectedDate = dateTime;
                              cubit.getScheduleList(_selectedDateStr);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        LocaleKeys.updateScheduleHeader.tr(),
                        style: getBody1TextStyle(),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    sliver: SliverGrid.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 4,
                      children:
                          Iterable<int>.generate(_dataSource.length).map((i) {
                        final model = _dataSource[i];
                        return ReservableDateChip(
                          text: model.timeSlot.timeString,
                          borderColor: model.borderColor(theme),
                          fillColor: model.fillColor(theme),
                          textColor: model.textColor(theme),
                          onTap: model.isReservated
                              ? null
                              : () => _selectTimeSlot(i),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              color: theme.scaffoldBackgroundColor,
              child: Button(
                text: LocaleKeys.updateScheduleSubmit.tr(),
                onPressed: _updateSchedule,
              ),
            ),
          ),
        );
      }),
    );
  }
}
