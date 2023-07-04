import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/ui/components/tiles/student_tutor_available_time/select_reservable_date_model.dart';

class SelectReservableDateListTile extends StatelessWidget {
  const SelectReservableDateListTile({
    super.key,
    required this.model,
    this.onTap,
    required this.state,
  });

  final ReservableDateItemModel model;
  final TutorAvailableTimeTileState state;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: state.fillColor(context),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  "${model.timeSlot}",
                  style: getHeadline3TextStyle(),
                ),
              ),
              const SizedBox(width: 8.0),
              Image.asset(
                state.assetIcon,
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
