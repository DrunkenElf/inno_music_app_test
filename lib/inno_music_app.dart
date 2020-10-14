import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_music_app/pages/home_page.dart';
import 'package:inno_music_app/widgets/animated_page_wrapper.dart';

import 'blocs/bloc.dart';
import 'pages/library_page.dart';
import 'pages/search_page.dart';
import 'widgets/custom_expanding_bar.dart';

var current = 0;

class InnoMusicApp extends StatelessWidget {
  const InnoMusicApp({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => InnoMusicApp());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageBloc>(
          lazy: false,
          create: (context) => PageBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
      ],
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: own,
          child: SafeArea(
            child: BlocBuilder<PageBloc, PageState>(
              builder: (BuildContext context, state) {
                print("blocBuild $state");
                if (state is PageHomeState)
                  return AnimatedPageWrapper(child: HomePage());
                else if (state is PageSearchState)
                  return AnimatedPageWrapper(child: SearchPage());
                else if (state is PageLibraryState)
                  return AnimatedPageWrapper(child: LibraryPage());
                else
                  return AnimatedPageWrapper(child: HomePage());
              },
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<PageBloc, PageState>(
          builder: (BuildContext context, PageState state) {
            print("onBuildNav  " + state.toString());

            return CustomExnadingBottomNavBar(
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              navBarHeight: 56,
              //mybloc: ,
              items: [
                CustomExpandingBottomBarItem(
                    icon: Icons.home,
                    iconColor: Theme.of(context).accentColor,
                    text: "Home",
                    selectedColor: Theme.of(context).primaryColor),
                CustomExpandingBottomBarItem(
                    icon: Icons.search,
                    iconColor: Theme.of(context).accentColor,
                    text: "Search",
                    selectedColor: Theme.of(context).primaryColor),
                CustomExpandingBottomBarItem(
                    icon: Icons.person,
                    iconColor: Theme.of(context).accentColor,
                    text: "Your Library",
                    selectedColor: Theme.of(context).primaryColor),
              ],
              onIndexChanged: (index) {
                current = index;
                print(
                    "onChangeIndex, ind: " + index.toString() + " old $state");
                if (index.toInt() == 2)
                  BlocProvider.of<PageBloc>(context)
                      .add(new EventLibraryPage());
                else if (index.toInt() == 1)
                  BlocProvider.of<PageBloc>(context).add(new EventSearchPage());
                else
                  BlocProvider.of<PageBloc>(context).add(new EventHomePage());
                //BlocProvider.of<PageBloc>(context).add(new EventHomePage());

                //setState()
                print("onChange, stateName: new " + state.toString());
              },
              selectedIndex: current,
            );
          },
        ),
      ),
    );
  }
}

const SystemUiOverlayStyle own = SystemUiOverlayStyle(
  systemNavigationBarColor: Color(0xff348f41),
  systemNavigationBarDividerColor: null,
  statusBarColor: Color(0xff80bc00),
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);
