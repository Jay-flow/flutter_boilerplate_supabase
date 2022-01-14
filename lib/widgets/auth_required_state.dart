import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/login.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRequiredState<T extends StatefulWidget>
    extends SupabaseAuthRequiredState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      Get.offAll(const Login());
    }
  }
}
