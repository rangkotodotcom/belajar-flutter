import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _signinUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<AuthB>(context, listen: false)
            .signIn(data.name.toString(), data.password.toString());
        return null;
      } catch (err) {
        return err.toString();
      }
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<AuthB>(context, listen: false)
            .signUp(data.name.toString(), data.password.toString());
        return null;
      } catch (err) {
        return err.toString();
      }
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'LEARNING',
      // logo: const AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _signinUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Provider.of<AuthB>(context, listen: false).tempData();
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
