import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/account.dart';
import 'package:flutter_boilerplate/screens/login.dart';
import 'package:flutter_boilerplate/utils/localization.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      Get.offAll(const Login());
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      Get.offAll(const Account());
    }
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    Get.snackbar(t('error'), message);
  }
}
