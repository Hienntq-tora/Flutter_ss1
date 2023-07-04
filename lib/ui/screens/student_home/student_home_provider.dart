import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/screens/student_home/student_home.dart';
import 'package:time_tracker/ui/screens/student_home/student_home_cubit.dart';

class StudentHomeProvider extends StatelessWidget {
  const StudentHomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentHomeCubit>(
      create: (context) => di.sl<StudentHomeCubit>(),
      child: const StudentHome(),
    );
  }
}
