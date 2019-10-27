import 'package:flutter/material.dart';
import 'package:flutter_silver_bar/core/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class AppCustomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);

    return SliverAppBar(
      centerTitle: true,
      title: Text(
        "Flutter Charts",
      ),
      floating: false,
      pinned: true,
      snap: false,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      expandedHeight: 150.0,
      brightness: Brightness.light,
      backgroundColor: model.cor,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
              decoration: BoxDecoration(
                color: Colors.red[500],
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(28)),
              ),
              child: IconButton(
                padding: EdgeInsets.only(top: 70),
                icon: Icon(
                  Icons.account_balance,
                  size: 80.0,
                  color: Colors.white,
                ),
              ))),
    );
  }
}
