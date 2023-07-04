import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/card/lesson_card.dart';
import 'package:time_tracker/ui/components/forms/search_form_field.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/lesson_detail/lesson_detail_bottom_sheet.dart';
import 'package:time_tracker/ui/screens/search_lesson/filter_lesson/filter_lesson.dart';
import 'package:time_tracker/ui/screens/search_lesson/search_lesson_cubit.dart';
import 'package:time_tracker/ui/screens/search_lesson/search_lesson_state.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/student_tutor_available_time_params.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import 'package:time_tracker/utils/util.dart';

import '../../../configs/icon_manager.dart';
import '../../components/buttons/square_button.dart';

class SearchLessonPage extends StatefulWidget {
  const SearchLessonPage({super.key, this.fieldId});

  final String? fieldId;

  @override
  State<SearchLessonPage> createState() => _SearchLessonPageState();
}

class _SearchLessonPageState extends State<SearchLessonPage> {
  final searchFieldController = TextEditingController();
  final _textInputSubject = BehaviorSubject<String>();

  final buttonKey = GlobalKey();
  var cubit = di.sl<SearchLessonCubit>();
  var params = SearchLessonParams();

  @override
  void initState() {
    params.fieldId = widget.fieldId;
    _textInputSubject.stream
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen((text) {
      params.search = text;
      cubit.searchLesson(params);
    });

    super.initState();
  }

  @override
  void dispose() {
    searchFieldController.dispose();
    _textInputSubject.close();
    super.dispose();
  }

  void showLessonDetail(Lesson? lesson) {
    if (lesson != null) {
      LessonDetailBottomSheet(
        lesson: lesson,
        onCompleted: () => context.push(
          AppPage.studentTutorAvailableTime.toPath,
          extra: StudentTutorAvailableTimeParams(
            lesson.id,
            lesson.user?.id ?? "",
          ),
        ),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchLessonCubit>(
      create: (context) => cubit..searchLesson(params),
      child: BlocConsumer<SearchLessonCubit, SearchLessonBlocState>(
        listener: (context, state) {
          if (state.searchLessonStatus == SearchLessonStatus.loadSuccess) {}

          if (state.searchLessonStatus == SearchLessonStatus.loadFailure) {
            ErrorHandler.showError(context, state.errorObject!);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SquareButton(
                        icon: SvgPicture.asset(
                          IconManager.back,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).textTheme.bodyMedium?.color ??
                                  Colors.white,
                              BlendMode.srcIn),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Theme.of(context).scaffoldBackgroundColor,
                        splashColor: Theme.of(context).dividerColor,
                      ),
                      Expanded(
                        child: SearchFormField(
                          hintText: LocaleKeys.searchLessonTextField.tr(),
                          textInputAction: TextInputAction.next,
                          controller: searchFieldController,
                          onChanged: (value) {
                            _textInputSubject.sink.add(value ?? "");
                          },
                          onEditingComplete: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            cubit.searchLesson(params);
                          },
                          validator: SupportValidators.compose([]),
                          onTapTrailing: () {
                            _showFilterLessonBottomSheet(
                                context, state.fields ?? []);
                          },
                          trailingButtonKey: buttonKey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: LoadingContainer(
              isLoading: params.search.isEmptyOrNull &&
                  state.searchLessonStatus == SearchLessonStatus.loading,
              child: SafeArea(
                child: ((state.data?.length ?? 0) > 0)
                    ? ListView.separated(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => LessonCard(
                          lesson: state.data?[index],
                          onTap: () => showLessonDetail(
                            state.data?[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.data?.length ?? 0,
                      )
                    : Center(
                        child: Text(LocaleKeys.noData.tr()),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFilterLessonBottomSheet(BuildContext context, List<Field> items) {
    Field? field;
    if (!params.fieldId.isEmptyOrNull) {
      field = items.firstWhere((element) => element.id == params.fieldId);
    }

    final filtterLessonBottomSheet = FilterLessonBottomSheet(
        onFilterSuccess: (fieldId, difficulty) {
          params.fieldId = fieldId;
          params.difficulty = difficulty;
          cubit.searchLesson(params);
        },
        items: items,
        selectedField: field,
        selectedLevel: params.difficulty);

    filtterLessonBottomSheet.show(context);
  }
}
