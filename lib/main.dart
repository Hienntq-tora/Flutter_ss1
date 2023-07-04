import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/core/services/fcm_service.dart';
import 'package:time_tracker/core/services/local_notification_service.dart';
import 'package:time_tracker/core/services/shipbook_service.dart';
import 'package:time_tracker/data/resources/mappers/notification_output_mapper.dart';
import 'package:time_tracker/routes/route.dart';
import 'package:time_tracker/ui/screens/login/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'configs/theme_manager.dart';
import 'core/services/injection.dart' as di;
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.sl<ShipBookService>().initialize();
  di.sl<FcmService>().initialize();
  di.sl<LocalNotificationService>().initialize();
  runApp(EasyLocalization(
    supportedLocales: L10n.all,
    path: 'assets/l10n',
    fallbackLocale: L10n.all[0],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setupInteractedMessage() {
    di.sl<FcmService>().onInitialMessage.listen((response) {
      di
          .sl<AppRouter>()
          .router
          .go("${response.type?.toPath}", extra: response.type?.toIndex);
    });
    di.sl<FcmService>().onMessageOpenedApp.listen((response) {
      di
          .sl<AppRouter>()
          .router
          .push("${response.type?.toPath}", extra: response.type?.toIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setupInteractedMessage();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (context) => di.sl<AuthCubit>()),
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: lightThemeData(context),
          darkTheme: darkThemeData(context),
          routerConfig: di.sl<AppRouter>().router,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ));
  }
}
