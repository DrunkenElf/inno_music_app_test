import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_music_app/blocs/bloc.dart';
import 'package:inno_music_app/widgets/search_sliver_grid.dart';
import 'package:theme_provider/theme_provider.dart';

Future<void> future(BuildContext context) async {
  Future<void>.delayed(Duration(seconds: 4))
      .then((value) => BlocProvider.of<SearchBloc>(context).add(EventLoaded()));
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    future(context);
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                brightness: ThemeProvider.themeOf(context).data.brightness,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 68),
                      child: Text('Search',
                          style: TextStyle(
                            //color: Colors.white,
                            color: ThemeProvider.themeOf(context)
                                .data
                                .backgroundColor,
                            fontSize: 24,
                          )),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(68),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 68,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextField(
                          //controller: _searchController,
                          //focusNode: _searchFocusNode,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search,
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor),
                            hintText: 'Authors, topics, or songs',
                            hintStyle: TextStyle(),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.grey, fontSize: 18.0),
                          onSubmitted: ((value) {}),
                        ),
                      )),
                ),
                backgroundColor:
                    ThemeProvider.themeOf(context).data.backgroundColor,
                floating: true,
                pinned: true,
                expandedHeight: 180,
                snap: false,
              ),
              SearchCategoryTitle(
                  title: 'Your top genres',
                  color: ThemeProvider.themeOf(context).data.primaryColorDark),
              SearchSliverGrid(),
              SearchCategoryTitle(
                  title: 'Browse all',
                  color: ThemeProvider.themeOf(context).data.primaryColorDark),
              SearchSliverGrid(),
              SliverFillRemaining(
                child: Container(
                  color: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SearchCategoryTitle extends StatelessWidget {
  final String title;
  final Color color;

  const SearchCategoryTitle({Key key, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16),
        child: Text(
          title,
          style: TextStyle(color: color, fontSize: 24),
        ),
      ),
    );
  }
}
