import 'package:flutter/material.dart';
import 'package:inno_music_app/pages/library_page.dart';
import 'package:theme_provider/theme_provider.dart';

class LibListItem extends StatelessWidget {
  final int index;

  const LibListItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 56,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Icon(imgs[index],
                    color: ThemeProvider.themeOf(context).data.primaryColor)),
            Container(
                padding: EdgeInsets.only(left: 36, right: 36),
                alignment: Alignment.centerLeft,
                child: Text(titles[index],
                    style: TextStyle(
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                        fontSize: 18))),
          ],
        ),
      ),
    );
  }
}
