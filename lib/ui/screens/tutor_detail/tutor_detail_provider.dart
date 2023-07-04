import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/screens/tutor_detail/tutor_detail.dart';
import 'package:time_tracker/ui/screens/tutor_detail/tutor_detail_cubit.dart';

class TutorDetailProvider extends StatelessWidget {
  const TutorDetailProvider(
      {Key? key, required this.tutorId, this.isFromLessonHistoryPage = false})
      : super(key: key);

  final String tutorId;
  final bool isFromLessonHistoryPage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TutorDetailCubit>(
      create: (context) => di.sl<TutorDetailCubit>(),
      child: TutorDetail(
          tutorId: tutorId, isFromLessonHistoryPage: isFromLessonHistoryPage),
    );
  }
}
