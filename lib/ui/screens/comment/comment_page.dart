import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/dialogs/success_dialog.dart';
import 'package:time_tracker/ui/components/forms/text_area_form_field.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/components/rating_bar.dart';
import 'package:time_tracker/ui/screens/comment/comment_bloc_state.dart';
import 'package:time_tracker/ui/screens/comment/comment_cubit.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/validations/support_validator.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key, required this.bookingId});
  final String bookingId;
  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final commentFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var cubit = di.sl<PostCommentCubit>();
  double _rating = 5.0;

  @override
  Widget build(BuildContext context) {
    final successDialog = SuccessDialog(
      "Comment success",
      "Now you can navigate to history lesson page",
      onClose: (value) {
        context.pop("need_reload_page");
      },
    );

    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<PostCommentCubit, PostCommentBlocState>(
        listener: (context, state) {
          if (state.status == PostCommentStatus.loadSuccess) {
            successDialog.show(context);
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: LoadingContainer(
              isLoading: state.status == PostCommentStatus.loading,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                bottomNavigationBar: Container(
                  padding: const EdgeInsets.all(16),
                  child: Button(
                    text: LocaleKeys.commentTitle.tr(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();

                        cubit.postComment(widget.bookingId,
                            commentFieldController.text, _rating);
                      }
                    },
                  ),
                ),
                body: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(
                        title: LocaleKeys.commentTitle.tr(),
                        backPress: () => context.pop(),
                      ),
                      Text(LocaleKeys.ratingLabel.tr()),
                      const SizedBox(height: 8),
                      Container(
                        alignment: Alignment.center,
                        child: RatingBar(
                          rating: _rating,
                          showText: false,
                          size: 43,
                          callBack: (value) {
                            _rating = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(LocaleKeys.commentLabel.tr()),
                      const SizedBox(height: 8),
                      Form(
                        key: _formKey,
                        child: SizedBox(
                          width: double.infinity,
                          child: TextAreaFormField(
                            keyboardType: TextInputType.multiline,
                            hintText: LocaleKeys.commentTitle.tr(),
                            maxLines: 4,
                            minLines: 4,
                            controller: commentFieldController,
                            onChanged: (value) {},
                            validator: SupportValidators.compose([
                              SupportValidators.required(fieldName: "comment")
                            ]),
                          ),
                        ),
                      ),
                    ],
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
