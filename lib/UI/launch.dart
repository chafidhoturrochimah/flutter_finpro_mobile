import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/UI/drawernavigation/nav-drawer.dart';

class NavigationDrawer extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text("My Stock"),
        // leading: new IconButton(
        //   icon: new Icon(Icons.account_circle),
        //   onPressed: () => _scaffoldKey.currentState.openDrawer(),
        // ),
      ),
      drawer: DrawerWidget(),
      endDrawer: DrawerWidget(),
      body: Center(
          child: Text('Belajar Navigation Drawer di Flutter',
              style: TextStyle(fontSize: 20))),
    );
  }
}
