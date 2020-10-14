import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:inno_music_app/blocs/init/initial_bloc.dart';

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'SABATON',
      logo: 'assets/images/icon4.png',
      onLogin: (_) => emulateValidAuth(context),
      onSignup: (_) => emulateValidAuth(context),
      onSubmitAnimationCompleted: () {
        emulateValidAuth(context);
      },
      onRecoverPassword: (_) => emulateValidAuth(context),
    );
  }
}

Future<String> emulateValidAuth(BuildContext context) async {
  return Future<String>.delayed(Duration(seconds: 3)).then((value) {
    print("emulateAuth: LoginScreen");
    BlocProvider.of<InitialBloc>(context).add(EventLogged());
    return "zsd";
  });
}
