import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/secondary_button.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/components/tiles/report_tile.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/report/report_bloc_state.dart';
import 'package:time_tracker/ui/screens/report/report_model.dart';
import 'package:time_tracker/ui/screens/report/repport_cubit.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key, required this.lessonId});
  final String? lessonId;
  @override
  State<ReportPage> createState() => _ReportPageState();
}

final List<ReportModel> _reportModel = [
  ReportModel(title: LocaleKeys.reportType5.tr(), reportType: 5),
  ReportModel(title: LocaleKeys.reportType4.tr(), reportType: 4),
  ReportModel(title: LocaleKeys.reportType3.tr(), reportType: 3),
  ReportModel(title: LocaleKeys.reportType2.tr(), reportType: 2),
  ReportModel(title: LocaleKeys.reportType1.tr(), reportType: 1),
  ReportModel(title: LocaleKeys.reportType0.tr(), reportType: 0),
];

class _ReportPageState extends State<ReportPage> {
  final _formkey = GlobalKey<FormState>();
  final _textFieldController = TextEditingController();
  var cubit = di.sl<PostReportCubit>();

  void selectReport(int index) {
    setState(() {
      _reportModel[index].isChecked = !_reportModel[index].isChecked;
    });
  }

  void resetForm() {
    for (var reportModel in _reportModel) {
      reportModel.isChecked = false;
    }
  }

  @override
  void dispose() {
    resetForm();
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String controllerText = "";

    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<PostReportCubit, PostReportBlocState>(
        listener: (context, state) {
          if (state.status == PostReportStatus.loadSuccess) {
            _formkey.currentState!.reset();
            context.pop("need_reload_page");
          }
          if (state.status == PostReportStatus.loadFailure) {
            ErrorHandler.showError(context, state.errorObject!);
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: LoadingContainer(
              isLoading: state.status == PostReportStatus.loading,
              child: Scaffold(
                appBar: Header(
                  title: LocaleKeys.reportTitle.tr(),
                ),
                resizeToAvoidBottomInset: false,
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Button(
                          text: LocaleKeys.reportLabel.tr(),
                          onPressed: () {
                            if (_reportModel
                                .where((model) => model.isChecked)
                                .isNotEmpty) {
                              if (_reportModel.last.isChecked) {
                                _formkey.currentState!.validate();
                                controllerText = _textFieldController.text;
                              }

                              if (!_formkey.currentState!.validate()) {
                                return;
                              }

                              cubit.postReport(
                                widget.lessonId,
                                _reportModel
                                    .where((model) => model.isChecked)
                                    .map((e) => e.reportType)
                                    .toString()
                                    .replaceAll('(', '[') // from "(0)"
                                    .replaceAll(')', ']'), // convert to "[0]"
                                controllerText,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    LocaleKeys.reportValidate1.tr(),
                                  ),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            }
                          }),
                      const SizedBox(height: 16),
                      SecondaryButton(
                        text: LocaleKeys.reportBack.tr(),
                        onPressed: () {
                          _formkey.currentState!.reset();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                body: Form(
                  key: _formkey,
                  child: ListView.builder(
                    itemCount: _reportModel.length,
                    itemBuilder: (context, index) {
                      return ReportTile(
                          onTap: () {
                            selectReport(index);
                          },
                          title: _reportModel[index].title,
                          selectedIcon: Image.asset(IconManager.tickFilled),
                          emptyIcon: Image.asset(IconManager.tickEmpty),
                          isSelected: _reportModel[index].isChecked,
                          controller: (index == (_reportModel.length - 1))
                              ? _textFieldController
                              : null);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
