import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/controller/count_controller.dart';
import 'package:flutter_boilerplate/utils/localization.dart';
import 'package:flutter_boilerplate/widgets/auth_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends AuthState<Home> {
  final controller = Get.put(CountController());

  @override
  void initState() {
    recoverSupabaseSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t("appName"),
        ),
      ),
      body: Center(
        child: SpinKitFadingCircle(
          color: Theme.of(context).indicatorColor,
          size: 50.0,
        ),
      ),
    );
  }
}
