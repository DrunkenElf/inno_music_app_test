import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_music_app/blocs/init/initial_bloc.dart';
import 'package:inno_music_app/inno_music_app.dart';
import 'package:logging/logging.dart';
import 'package:theme_provider/theme_provider.dart';

import 'views/LoginScreen.dart';
import 'views/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.SHOUT;

  Logger.root.onRecord.listen((record) {
    print(
        '${record.level.name}: - ${record.time}: ${record.loggerName}: ${record.message}');
  });

  Map<int, Widget> op = {1: LoginScreen(), 2: LoginScreen()};
  runApp(
    BlocProvider<InitialBloc>(
      create: (context) => InitialBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CustomSplash(
          imagePath: 'assets/images/icon4.png',
          backGroundColor: Color(0xff80bc00),
          // backGroundColor: Color(0xfffc6042),
          animationEffect: 'zoom-in',
          logoSize: 200,
          home: MainApp(),
          customFunction: () {
            return 1;
          },
          duration: 2500,
          type: CustomSplashType.StaticDuration,
          outputAndHome: op,
        ),
      ),
    ),
  );
}

final prCol = Color(0xff80bc00);
final bluel = Color(0xff97caeb);
final bluell = Color(0xffc5d9e7);
final greenR = Color(0xff348f41);
final orangeR = Color(0xffff5c35);
final purple = Color(0xff60269e);
final blueD = Color(0xdf1a428a);

final theme = ThemeData(
  primaryColor: prCol,
  accentColor: Color(0xff1a428a),
  //canvasColor: ,
  //scaffoldBackgroundColor: ,
  bottomAppBarColor: Color(int.parse("0xff80bc00")),
  textTheme: TextTheme(
    headline5: TextStyle(
      color: greenR,
    ),
  ),
  //buttonColor: ,
  //backgroundColor: ,
  //brightness: Brightness.light,
  /*fontFamily: ,
  textTheme: TextTheme(
c
  ),*/
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitialBloc>(
      create: (context) => InitialBloc(),
      child: AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({Key key}) : super(key: key);

  @override
  _AppViewState createState() {
    return _AppViewState();
  }
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<InitialBloc, InitialState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case StateLogged:
                _navigator.pushAndRemoveUntil<void>(
                  InnoMusicApp.route(),
                  (route) => false,
                );
                break;
              case StateNotLogged:
                _navigator.pushAndRemoveUntil<void>(
                  LoginScreen.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashScreen.route(),
    );
  }
}

class MainApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MainApp());
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      defaultThemeId: "custom_light",
      themes: [
        AppTheme.light(),
        AppTheme.dark(),
        AppTheme(
          id: "custom_light",
          description: "inno_app_light",
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xff80bc00),
            primaryColorDark: Color(0xff348f41),
            accentColor: Color(0xdf1a428a),
            backgroundColor: Colors.white,
            brightness: Brightness.light,
          ),
        ),
      ],
      // onInitCallback: (controller, event),
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: "Inno Music",
            navigatorKey: _navigatorKey,
            builder: (context, child) {
              return BlocListener<InitialBloc, InitialState>(
                listener: (context, state) {
                  switch (state.runtimeType) {
                    case StateLogged:
                      _navigator.pushAndRemoveUntil<void>(
                        InnoMusicApp.route(),
                        (route) => false,
                      );
                      break;
                    case StateNotLogged:
                      _navigator.pushAndRemoveUntil<void>(
                        LoginScreen.route(),
                        (route) => false,
                      );
                      break;
                    default:
                      break;
                  }
                },
                child: child,
              );
            },
            onGenerateRoute: (_) => LoginScreen.route(),
          ),
        ),
      ),
    );
  }
}
