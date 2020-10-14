import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class HomePopular extends StatelessWidget {
  final String title;
  final bool isTop;

  const HomePopular({Key key, this.title, this.isTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          padding:
                              EdgeInsets.only(left: 8.0, top: 4, bottom: 4),
                          child: Text(names[index],
                              style: TextStyle(
                                  fontSize: 19,
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .backgroundColor)),
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
}

final List<String> names = <String>['Author1', 'Author2', 'Author3'];
final List<String> ics = <String>[
  'assets/images/icon4.png',
  'assets/images/icon4.png',
  'assets/images/icon4.png'
];

int getInd(bool isTop, int index) {
  if (isTop)
    return index + 2;
  else {
    return index + 1;
  }
}
