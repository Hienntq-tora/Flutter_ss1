import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/domain/enums/date_formats.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/slidable/tutor_home_slidable.dart';
import 'package:time_tracker/ui/screens/tutor_cancel_appointment_bottom_sheet/tutor_cancel_appointment_bottom_sheet.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_cubit.dart';
import 'package:time_tracker/utils/util.dart';
import '../../../domain/entities/tutor_appointment.dart';
import '../../components/tiles/tutor_appointment/tutor_appointment_card.dart';
import '../../components/tiles/tutor_appointment/tutor_appointment_card_model.dart';
import '../../components/tiles/tutor_appointment/tutor_appointment_header.dart';

class TutorAppointmentPage extends StatefulWidget {
  const TutorAppointmentPage({super.key, this.appointments});

  final List<TutorAppointment>? appointments;

  @override
  State<TutorAppointmentPage> createState() => _TutorAppointmentPageState();
}

class _TutorAppointmentPageState extends State<TutorAppointmentPage>
    with AutomaticKeepAliveClientMixin<TutorAppointmentPage> {
  List<TutorAppoinmentCardSection>? _dataSource;

  void _onTilePressed() {
  }

  void _onDismissed(int section, int item) {
    setState(() {
      _dataSource?[section].appointmentList.removeAt(item);
      if (_dataSource?[section].appointmentList.isEmpty ?? false) {
        _dataSource?.removeAt(section);
      }
    });
  }

  Future<bool> _confirmDismiss(String appointmentId) async {
    final result =
        await TutorCancelAppointmentBottomSheet(appointmentId).show(context);
    return Future<bool>.value(result ?? false);
  }

  List<TutorAppoinmentCardSection>? _convertList(List<TutorAppointment>? list) {
    if (list == null) return null;
    final filteredList = list.where((element) => element.isCancel == false);
    final dates = filteredList.map((e) => e.reservableDate?.datetime).toSet();

    return dates.map((date) {
      final dateTime = date.parseToDate(DateFormats.serverDate);
      final formattedDay =
          dateTime.parseToString(DateFormats.abbreviatedWeekDay);
      final formattedDate = dateTime.parseToString(DateFormats.appointmentDate);

      final itemList = filteredList.where((element) {
        return (element.reservableDate?.datetime == date);
      }).map((e) {
        return TutorAppoimentCardItem(
          appointmentId: e.id ?? "",
          title: "${e.lesson?.title}",
          lessonImageUrl: e.lesson?.imageUrl,
          studentImageUrl: e.student?.userInfo?.avatarUrl ?? "",
          difficulty: "${e.lesson?.difficulty}",
          timeSlot: "${e.reservableDate?.timeString}",
          fullName: "${e.student?.fullName}",
          linkMeeting: "${e.lesson?.linkMeeting}",
        );
      }).toList();

      return TutorAppoinmentCardSection(
        day: "$formattedDay",
        date: "$formattedDate${dateTime?.getDayOfMonthSuffix()}",
        appointmentList: itemList,
      );
    }).toList();
  }

  List<Widget> _buildList() {
    final dataSource = _dataSource;
    List<Widget> sliverList = [];

    if (dataSource == null) return sliverList;

    if (dataSource.isEmpty) {
      sliverList.add(
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text(
              LocaleKeys.noData.tr(),
              style: getSemiBold16TextStyle(),
            ),
          ),
        ),
      );

      return sliverList;
    }

    sliverList.add(const SliverPadding(padding: EdgeInsets.only(top: 16)));

    for (var sectionIndex = 0;
        sectionIndex < dataSource.length;
        sectionIndex++) {
      final sectionModel = dataSource[sectionIndex];

      final header = SliverPadding(
        padding: const EdgeInsets.only(left: 16.0),
        sliver: SliverToBoxAdapter(
          child: TutorAppointmentHeader(
            day: sectionModel.day,
            date: sectionModel.date,
          ),
        ),
      );

      final appointmentList = SliverPadding(
        padding: const EdgeInsets.fromLTRB(85.0, 10.0, 16.0, 0.0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: sectionModel.appointmentList.length,
            (context, itemIndex) {
              final itemModel = sectionModel.appointmentList[itemIndex];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TutorHomeSlidable(
                  key: ValueKey<TutorAppoimentCardItem>(itemModel),
                  confirmDismiss: () {
                    return _confirmDismiss(itemModel.appointmentId);
                  },
                  onDismissed: () {
                    _onDismissed(sectionIndex, itemIndex);
                  },
                  child: TutorAppoimentCard(
                    itemModel: itemModel,
                    onTap: _onTilePressed,
                  ),
                ),
              );
            },
          ),
        ),
      );
      sliverList.addAll([header, appointmentList]);
    }

    return sliverList;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _dataSource = _convertList(widget.appointments);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<TutorHomeCubit, TutorHomeBlocState>(
      listener: (context, state) {
        if (state.status == TutorHomeStatus.loadListsSuccess) {
          setState(() {
            _dataSource = _convertList(state.appointments);
          });
        }
      },
      builder: (context, state) {
        return SlidableAutoCloseBehavior(
          closeWhenOpened: true,
          child: CustomScrollView(
            slivers: _buildList(),
          ),
        );
      },
    );
  }
}
