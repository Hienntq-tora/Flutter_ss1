import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/screens/lesson_history/lesson_history_cubit.dart';
import 'package:time_tracker/ui/screens/lesson_history/lesson_history_page.dart';

class StudentHistoryProvider extends StatelessWidget {
  const StudentHistoryProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonHistoryCubit>(
      create: (context) => di.sl<LessonHistoryCubit>(),
      child: const LessonHistoryPage(),
    );
  }
}
