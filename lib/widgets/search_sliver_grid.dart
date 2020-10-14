import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inno_music_app/blocs/bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SearchSliverGrid extends StatelessWidget {
  const SearchSliverGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width / 2.1,
            height: 50,
            padding: EdgeInsets.only(left: 8, right: 8, top: 4),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 4,
              child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (BuildContext context, state) {
                var _enabled = true;
                if (state is StateLoaded) _enabled = false;
                switch (state.runtimeType) {
                  case StateLoading:
                  case StateNoNetwork:
                    return Shimmer(
                      duration: Duration(seconds: 2),
                      child: Container(color: Colors.purple),
                      enabled: _enabled,
                    );
                    break;
                  case StateLoaded:
                    return Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 46,
                          child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Image.asset(
                                  'assets/images/sea${getInd(true, index)}.png')),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(16),
                            child: Text('Rock ${index + 1}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24)))
                      ],
                    );
                    break;
                  default:
                    print("default case");
                    return Shimmer(
                      duration: Duration(seconds: 2),
                      child: Container(color: Colors.red),
                    );
                }
              }),
            ),
          );
        },
        childCount: 4,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 2,
        childAspectRatio: 2,
      ),
    );
  }
}

int getInd(bool isTop, int index) {
  if (isTop)
    return 4 - index;
  else {
    return index + 1;
  }
}
