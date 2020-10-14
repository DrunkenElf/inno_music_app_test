import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_music_app/blocs/init/initial_bloc.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashScreen());
  }

  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //emulateLogged(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent, Colors.white])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 70.0, bottom: 20.0),
              child: new Text(
                "Hello World",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10.0),
              child: new Icon(
                Icons.bubble_chart,
                color: Colors.white,
                size: 130.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> emulateValidAuth(BuildContext context) async {
  Future<String>.delayed(Duration(seconds: 2)).then(
      (value) => BlocProvider.of<InitialBloc>(context).add(EventLogged()));
}

Future<void> emulateNotLogged(BuildContext context) async {
  Future<String>.delayed(Duration(seconds: 2)).then(
      (value) => BlocProvider.of<InitialBloc>(context).add(EventNotLogged()));
}
