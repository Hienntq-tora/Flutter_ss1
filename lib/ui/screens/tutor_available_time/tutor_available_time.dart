import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/dialogs/confirm_dialog.dart';
import 'package:time_tracker/ui/components/list/group_view/group_model.dart';
import 'package:time_tracker/ui/components/slidable/tutor_home_slidable.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_cubit.dart';
import '../../components/buttons/square_button.dart';
import '../../components/tiles/tutor_available_time/reservable_date_list_tile.dart';

typedef ReservableDateTileModel = GroupModel<String, ReservableDate>;

class TutorAvailableTimePage extends StatefulWidget {
  const TutorAvailableTimePage({super.key, this.reservableDates});

  final List<ReservableDate>? reservableDates;

  @override
  State<TutorAvailableTimePage> createState() => _TutorAvailableTimePageState();
}

class _TutorAvailableTimePageState extends State<TutorAvailableTimePage>
    with AutomaticKeepAliveClientMixin<TutorAvailableTimePage> {
  List<ReservableDateTileModel>? _dataSource;

  void _goToUpdateSchedule({String? dateTime}) async {
    final cubit = BlocProvider.of<TutorHomeCubit>(context);
    final routingResult =
        await context.push(AppPage.tutorUpdateSchedule.toPath, extra: dateTime);
    if (routingResult.toString() == "need_reload_page") {
      cubit.reload();
    }
  }

  Future<bool> _confirmDismiss(
    BuildContext context, {
    required String datetime,
  }) async {
    final cubit = BlocProvider.of<TutorHomeCubit>(context);
    final confirmDialog = ConfirmDialog(
      title: "Confirm Delete",
      cancelText: "Cancel",
    );

    final confirmFlag = await confirmDialog.show(context) ?? false;

    if (confirmFlag) {
      return await cubit.deleteReservableDate(datetime: datetime);
    }

    return false;
  }

  Widget _buildList(BuildContext context) {
    final dataSource = _dataSource;

    if (dataSource == null) return const SizedBox();

    if (dataSource.isEmpty) {
      return const Center(
        child: Text("No Data"),
      );
    }

    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      child: ListView.separated(
        itemCount: dataSource.length,
        itemBuilder: (context, index) {
          return TutorHomeSlidable(
            key: ValueKey(dataSource[index]),
            extentRatio: 0.2,
            dismissText: LocaleKeys.dismissibleTitle.tr(),
            confirmDismiss: () {
              return _confirmDismiss(context, datetime: dataSource[index].data);
            },
            onDismissed: () {
              setState(() {
                _dataSource?.removeAt(index);
              });
            },
            child: ReservableDateListTile(
              model: dataSource[index],
              onTap: () =>
                  _goToUpdateSchedule(dateTime: _dataSource?[index].data),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }

  List<ReservableDateTileModel>? _convertList(List<ReservableDate>? list) {
    if (list == null) return null;

    var dataSource = <ReservableDateTileModel>[];
    final dates = list.map((e) => e.datetime).toSet();

    dataSource = dates.map((datetime) {
      return ReservableDateTileModel(
        data: datetime ?? "",
        itemList: list
            .where((reservableDate) => reservableDate.datetime == datetime)
            .toList(),
      );
    }).toList();

    return dataSource;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _dataSource = _convertList(widget.reservableDates);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => BlocProvider.of<TutorHomeCubit>(context),
      child: BlocConsumer<TutorHomeCubit, TutorHomeBlocState>(
        listener: (context, state) {
          if (state.status == TutorHomeStatus.loadListsSuccess) {
            setState(() {
              _dataSource = _convertList(state.reservableDates);
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: SquareButton(
              icon: SvgPicture.asset(
                IconManager.edit1,
                width: 24,
                height: 24,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 5,
              shadowColor: Theme.of(context).shadowColor,
              dimension: 60.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              splashColor: Theme.of(context).dividerColor,
              onPressed: () => _goToUpdateSchedule(),
            ),
            body: _buildList(context),
          );
        },
      ),
    );
  }
}
