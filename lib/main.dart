import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/account.dart';
import 'package:flutter_boilerplate/screens/home.dart';
import 'package:flutter_boilerplate/screens/sign_in.dart';
import 'package:flutter_boilerplate/utils/themes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.get("SUPABASE_API_URL"),
    anonKey: dotenv.get("SUPABASE_ANON_KEY"),
    debug: dotenv.get("ENV") == "development",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void setStatusBarColors() {
    final schedulerBinding = SchedulerBinding.instance;

    if (schedulerBinding != null) {
      Brightness brightness = schedulerBinding.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: isDarkMode ? Colors.black : Colors.white,
          statusBarIconBrightness:
              isDarkMode ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColors();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ko', 'KR'),
      ],
      home: const Home(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const Home(),
        ),
        GetPage(
          name: '/sign-in',
          page: () => const SignIn(),
        ),
        GetPage(
          name: '/account',
          page: () => const Account(),
        ),
      ],
    );
  }
}
