import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/constants/constant.dart';
import 'package:time_tracker/data/resources/local_data_resource.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/image_loader/image_loader.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/login/auth_bloc_state.dart';
import 'package:time_tracker/utils/util.dart';
import '../../components/header/header.dart';
import '../../components/profile_item.dart';
import '../login/auth_cubit.dart';
import 'package:time_tracker/core/services/injection.dart' as di;

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
    final userData = di.sl<LocalDataResource>().getUserData();

    return BlocConsumer<AuthCubit, AuthBlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: LoadingContainer(
              isLoading: state.loginStatus == AuthStatus.loading,
              child: Column(
                children: [
                  Header(
                    title: LocaleKeys.profileTitle.tr(),
                  ),
                  ProfileItemWidget(
                    largeTitle: userData.fullName,
                    title: userData.email,
                    icon: ImageLoader(
                      imageUrl: userData.avatarUrl.isValidImageLink
                          ? userData.avatarUrl
                          : defaultImageUrl,
                      width: 50,
                      height: 50,
                      borderRadius: 25,
                    ),
                    onPressed: () => context
                        .push(AppPage.updateInformation.toPath)
                        .then((value) => setState(() {})),
                  ),
                  const Divider(height: 0),
                  ProfileItemWidget(
                    title: LocaleKeys.profileOption1.tr(),
                    icon: SvgPicture.asset(
                      IconManager.money,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodyMedium?.color ??
                              Colors.white,
                          BlendMode.srcIn),
                    ),
                    onPressed: () {},
                  ),
                  const Divider(height: 0),
                  ProfileItemWidget(
                    title: LocaleKeys.profileOption2.tr(),
                    icon: SvgPicture.asset(
                      IconManager.key,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodyMedium?.color ??
                              Colors.white,
                          BlendMode.srcIn),
                    ),
                    onPressed: () =>
                        context.push(AppPage.changePassword.toPath),
                  ),
                  const Divider(height: 0),
                  ProfileItemWidget(
                    title: LocaleKeys.profileOption3.tr(),
                    icon: SvgPicture.asset(
                      IconManager.logout,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodyMedium?.color ??
                              Colors.white,
                          BlendMode.srcIn),
                    ),
                    onPressed: () {
                      cubit.signOut();
                    },
                  ),
                  const Divider(height: 0),
                ],
              ),
            ),
          );
        });
  }
}
