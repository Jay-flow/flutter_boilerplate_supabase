import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/home.dart';
import 'package:flutter_boilerplate/utils/logger.dart';
import 'package:flutter_boilerplate/utils/themes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: implementation_imports
import 'package:flutter_dotenv/src/errors.dart' show FileNotFoundError;
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

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
