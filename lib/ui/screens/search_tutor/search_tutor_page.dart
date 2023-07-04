import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/data/resources/extra/extra.dart';
import 'package:time_tracker/domain/entities/tutor.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/forms/search_form_field.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/search_tutor/search_tutor_cubit.dart';
import 'package:time_tracker/ui/screens/search_tutor/search_tutor_state.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import 'package:time_tracker/utils/util.dart';

import '../../../routes/route_utils.dart';

class SearchTutorPage extends StatefulWidget {
  const SearchTutorPage({super.key, this.fieldId});

  final String? fieldId;

  @override
  State<SearchTutorPage> createState() => _SearchTutorPageState();
}

class _SearchTutorPageState extends State<SearchTutorPage> {
  final searchFieldController = TextEditingController();
  final _textInputSubject = BehaviorSubject<String>();

  final buttonKey = GlobalKey();

  // var params = SearchLessonParams();
  var cubit = di.sl<SearchTutorCubit>();
  var params = SearchTutorParams(search: null);
  List<Tutor> tutors = [];

  @override
  void initState() {
    _textInputSubject.stream
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen((text) {
      params.search = text;
      cubit.searchTutor(params);
    });

    super.initState();
  }

  @override
  void dispose() {
    searchFieldController.dispose();
    _textInputSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..searchTutor(params),
      child: BlocConsumer<SearchTutorCubit, SearchTutorBlocState>(
        listener: (context, state) {
          if (state.searchTutorStatus == SearchTutorStatus.loadSuccess) {
            tutors = state.data ?? [];
          }

          if (state.searchTutorStatus == SearchTutorStatus.loadFailure) {
            ErrorHandler.showError(context, state.errorObject!);
          }
        },
        builder: (context, state) {
          return LoadingContainer(
            isLoading: state.searchTutorStatus == SearchTutorStatus.loading,
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Header(title: LocaleKeys.searchTutor.tr()),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 50,
                        child: SearchFormField(
                          hintText: LocaleKeys.searchTutor.tr(),
                          textInputAction: TextInputAction.next,
                          controller: searchFieldController,
                          displaySuffixIcon: false,
                          onChanged: (value) {
                            _textInputSubject.sink.add(value ?? "");
                          },
                          onEditingComplete: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          validator: SupportValidators.compose([]),
                          onTapTrailing: () {},
                          trailingButtonKey: buttonKey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: tutors.length,
                        itemBuilder: (context, index) => TutorCard(
                          tutor: tutors[index],
                          onPressed: (id) {
                            context.push(
                              AppPage.tutorDetail.toPath,
                              extra: TutorDetailExtra(
                                userId: id,
                                isFromLessonHistoryPage: false,
                              ),
                            );
                          },
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TutorCard extends StatelessWidget {
  const TutorCard({
    super.key,
    required this.tutor,
    required this.onPressed,
  });

  final Tutor tutor;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(tutor.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(48 / 2),
                        child: CachedNetworkImage(
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          imageUrl: (tutor.avatarUrl.isEmptyOrNull ||
                                  tutor.avatarUrl == "default.png")
                              ? "https://www.touchtaiwan.com/images/default.jpg"
                              : tutor.avatarUrl,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          )),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          "${tutor.fullName}",
                          style: getSemiBold16TextStyle(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(width: 4),
                      CountryFlag(
                        country: Country.fromCode(tutor.countryFlag ?? ""),
                        // OR Country.fromCode('eg')
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Row(
                  children: [
                    Text(
                      "${tutor.ratings}",
                      style: getChipTextStyle(),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(IconManager.star),
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              tutor.aboutMe ?? "",
              style: getChipTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
