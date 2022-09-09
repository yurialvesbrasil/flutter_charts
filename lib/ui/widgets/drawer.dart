import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_silver_bar/ui/values/routes.dart';
import 'package:flutter_silver_bar/ui/widgets/custom_clip_path_down.dart';

class AppDrawer extends StatelessWidget {
  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.red[500],
          borderRadius: const BorderRadius.only(topRight: Radius.circular(28)),
        ),
        child: Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text("Flutter Step-by-Step",
              style: Theme.of(context).textTheme.headlineMedium),
        ));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(28), topRight: Radius.circular(28)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //_createHeader(context),
            ClipPath(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(28)),
                  ),
                  child: Carousel(
                    indicatorBgPadding: 35.0,
                    borderRadius: true,
                    radius: const Radius.circular(28),
                    images: [
                      ExactAssetImage("assets/carrosel/g1.png"),
                      ExactAssetImage("assets/carrosel/g2.png"),
                      ExactAssetImage("assets/carrosel/g3.png"),
                      ExactAssetImage("assets/carrosel/g4.png"),
                    ],
                  )),
              clipper: CustomClipPathDown(),
            ),
            _createDrawerItem(
                icon: Icons.insert_chart,
                text: 'BarChart',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.BAR_ROUTE)),
            Divider(),
            _createDrawerItem(icon: Icons.info_outline, text: 'Sobre'),
          ],
        ),
      ),
    );
  }
}
