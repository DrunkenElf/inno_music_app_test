import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
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
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('Discover',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        )),
                  ),
                ),
                bottom: PreferredSize(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    color: Colors.transparent,
                    /*child: Text(
                    'Discover',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),*/
                  ),
                  preferredSize: Size.fromHeight(56),
                ),
                backgroundColor: prCol,
                floating: true,
                pinned: true,
                expandedHeight: 128,
                snap: false,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      // _searchController.clear();
                      //FocusScope.of(context).requestFocus(_searchFocusNode);
                    },
                  ),
                ],
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                //fillOverscroll: true,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      getPopular("Popular this week", context, true),
                      getPopular("Continue listening", context, false),
                      getPopular('New Releases', context, true),
                    ],
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

final List<String> names = <String>['Author1', 'Author2', 'Author3'];
final List<String> ics = <String>[
  'assets/images/icon4.png',
  'assets/images/icon4.png',
  'assets/images/icon4.png'
];

Widget getPopular(String title, BuildContext context, bool isTop) {
  return Expanded(
    flex: 3,
    child: Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 8, right: 8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) => Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 2,
                child: Container(
                  width: 140.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: double.infinity,
                        child: FittedBox(
                          child: Image.asset(
                              "assets/images/icon${getInd(isTop, index)}.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 8.0, top: 4, bottom: 4),
                        child: Text(names[index],
                            style: TextStyle(fontSize: 19, color: blueD)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

int getInd(bool isTop, int index) {
  if (isTop)
    return index + 2;
  else {
    return index + 1;
  }
}

Widget getCard(String name) {
  return Card(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset("assets/images/takk2.png"),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(name),
        ),
      ],
    ),
  );
}
