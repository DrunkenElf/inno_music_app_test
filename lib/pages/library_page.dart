import 'package:flutter/material.dart';
import 'package:inno_music_app/widgets/lib_list_item.dart';
import 'package:theme_provider/theme_provider.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                brightness: Brightness.light,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    //alignment: Alignment.center,
                    color: Colors.transparent,
                    //padding: EdgeInsets.only(bottom: 8),
                    child: Text('My library',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        )),
                  ),
                ),

                backgroundColor:
                    ThemeProvider.themeOf(context).data.primaryColor,
                floating: true,
                pinned: true,
                //expandedHeight: 72,
                snap: false,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.settings,
                        color: ThemeProvider.themeOf(context)
                            .data
                            .backgroundColor),
                    onPressed: () {
                      // _searchController.clear();
                      //FocusScope.of(context).requestFocus(_searchFocusNode);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person,
                        color: ThemeProvider.themeOf(context)
                            .data
                            .backgroundColor),
                    onPressed: () {
                      // _searchController.clear();
                      //FocusScope.of(context).requestFocus(_searchFocusNode);
                    },
                  ),
                ],
              ),
              LibMyFavourites(),
              LibCards(),
              SliverFillRemaining(
                hasScrollBody: false,
                //fillOverscroll: true,
                child: Container(
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class LibMyFavourites extends StatelessWidget {
  const LibMyFavourites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 160,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            child: Container(
              color: ThemeProvider.themeOf(context).data.primaryColor,
              child: SizedBox(
                height: 120,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Container(
                        width: 120,
                        height: 120,
                        color: ThemeProvider.themeOf(context).data.accentColor,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 60,
                          height: 60,
                          color: Colors.white,
                          alignment: Alignment.bottomLeft,
                          child: Container(
                              //width: 50,
                              //height: 50,
                              alignment: Alignment.center,
                              child: Icon(Icons.favorite,
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .accentColor)),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      alignment: Alignment.centerLeft,
                      //color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('My favourites',
                              style: TextStyle(
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .backgroundColor,
                                  fontSize: 18)),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('128 tracks',
                                    style: TextStyle(
                                        color: ThemeProvider.themeOf(context)
                                            .data
                                            .backgroundColor,
                                        fontSize: 14)),
                                Text(' - 34 hours',
                                    style: TextStyle(
                                        color: ThemeProvider.themeOf(context)
                                            .data
                                            .backgroundColor,
                                        fontSize: 14)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget getMyFavorites(BuildContext context) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 160,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Container(
            color: ThemeProvider.themeOf(context).data.primaryColor,
            child: SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Container(
                      width: 120,
                      height: 120,
                      color: ThemeProvider.themeOf(context).data.accentColor,
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.white,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            //width: 50,
                            //height: 50,
                            alignment: Alignment.center,
                            child: Icon(Icons.favorite,
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .accentColor)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    alignment: Alignment.centerLeft,
                    //color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('My favourites',
                            style: TextStyle(
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .backgroundColor,
                                fontSize: 18)),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('128 tracks',
                                  style: TextStyle(
                                      color: ThemeProvider.themeOf(context)
                                          .data
                                          .backgroundColor,
                                      fontSize: 14)),
                              Text(' - 34 hours',
                                  style: TextStyle(
                                      color: ThemeProvider.themeOf(context)
                                          .data
                                          .backgroundColor,
                                      fontSize: 14)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class LibTextField extends StatelessWidget {
  final String title;

  const LibTextField({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      /*decoration: BoxDecoration(
      color: bluel,
    ),*/
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4,
          child: TextField(
            maxLines: 1,
            onChanged: (value) {},
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: "Search for podcasts and music",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
            ),
          )),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String title;

  const CategoryTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16),
        child: Text(title,
            style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColorDark,
                fontSize: 24)),
      ),
    );
  }
}

class LibCards extends StatelessWidget {
  final int childCount;

  const LibCards({Key key, this.childCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return LibListItem(index: index);
      }, childCount: 6),
    );
  }
}

/*SliverChildBuilderDelegate((BuildContext context, int index) {
          return LibListItem(index: index);
        }, childCount: 6))*/

final List<String> titles = [
  'Podcasts',
  'Authors',
  'Playlists',
  'Tracks',
  'Albums',
  'Artists'
];
final List<IconData> imgs = [
  Icons.mic_none_outlined,
  Icons.person,
  Icons.playlist_play,
  Icons.audiotrack,
  Icons.album,
  Icons.person
];
