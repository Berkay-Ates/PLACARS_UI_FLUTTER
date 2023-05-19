import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/constants/app/application_constants.dart';
import 'core/init/cache/shared/shared_object.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/theme/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'feature/splash/view/splash_view.dart';

void main() async {
  _init().then((value) {
    runApp(MultiProvider(
      providers: [ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider())],
      child: EasyLocalization(
          supportedLocales: LanguageManager.instance.supportedLocales,
          path: ApplicationConstants.langAssetPath,
          child: const MyApp()),
    ));
  });
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefObject.instance?.initShared();
  await Firebase.initializeApp();
  //await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const SplashHomeView(),
        //provider ile theme baglama
        theme: context.watch<ThemeProvider>().getThemeData);
  }
}
