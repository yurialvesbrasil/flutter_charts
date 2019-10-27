import 'package:flutter/material.dart';
import 'package:flutter_silver_bar/core/view_models/home_view_model.dart';
import 'package:flutter_silver_bar/ui/widgets/app_custom_bar.dart';
import 'package:flutter_silver_bar/ui/widgets/drawer.dart';
import 'package:flutter_silver_bar/ui/widgets/list_charts_bar.dart';
import 'package:provider/provider.dart';

class BarView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          color: Colors.white,
          child: CustomScrollView(
            controller: model.controller,
            slivers: <Widget>[
              AppCustomBar(),
              ListChartsBar(orientation: orientation),
            ],
          ),
        );
      }),
    );
  }
}
