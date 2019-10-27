import 'package:flutter/material.dart';
import 'package:flutter_silver_bar/ui/widgets/list_item_bar.dart';

class ListChartsBar extends StatelessWidget {
  final Orientation orientation;

  const ListChartsBar({Key key, this.orientation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.all(8),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            ///no.of items in the horizontal axis
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
          ),

          ///Lazy building of list
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              /// To convert this infinite list to a list with "n" no of items,
              /// uncomment the following line:
              /// if (index > n) return null;
              return listItemBar(
                  index, "Sliver Grid item:\n$index", orientation);
            },

            /// Set childCount to limit no.of items
            childCount: 19,
          ),
        ));
  }
}
