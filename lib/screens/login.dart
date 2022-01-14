import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/utils/localization.dart';
import 'package:flutter_boilerplate/utils/logger.dart';
import 'package:flutter_boilerplate/widgets/auth_state.dart';
import 'package:get/get.dart';
import 'package:supabase/supabase.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends AuthState<Login> {
  bool _isLoading = false;
  late final TextEditingController _emailController;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });

    var redrectTo = kIsWeb
        ? null
        : 'com.dooboolab.flutter_boilerplate_supabase://login-callback/';

    logger.d(redrectTo);

    final response = await supabase.auth.signIn(
        email: _emailController.text,
        options: AuthOptions(
          redirectTo: redrectTo,
        ));

    final error = response.error;

    if (error != null) {
      Get.snackbar(t('error'), error.message);
    } else {
      Get.snackbar(t('success'), 'Check your email for login link!');
      _emailController.clear();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          const Text('Sign in via the magic link with your email below'),
          const SizedBox(height: 18),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: _isLoading ? null : _signIn,
            child: Text(_isLoading ? 'Loading' : 'Send Magic Link'),
          ),
        ],
      ),
    );
  }
}
