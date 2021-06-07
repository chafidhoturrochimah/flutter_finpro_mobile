import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/auth/login_page.dart';
import 'package:flutter_finpro_mobile/auth/sign_in.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.apps,
              text: 'About',
              onTap: () => print('Tap My About')),
          _drawerItem(
              icon: Icons.book,
              text: 'Barang',
              onTap: () => print('Tap My Barang')),
          _drawerItem(
              icon: Icons.category,
              text: 'Kategori',
              onTap: () => print('Tap Kategori')),
          Divider(height: 30, thickness: 1),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
          //   child: Text("Labels",
          //       style: TextStyle(
          //         fontSize: 16,
          //         color: Colors.black54,
          //       )),
          // ),
          _drawerItem(
            icon: Icons.exit_to_app,
            text: 'Log Out',
            onTap: () async {
              await googleSignIn.signOut();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ),
        radius: 60),
    // otherAccountsPictures: [
    //   ClipOval(
    //     child: Image(
    //         image: AssetImage('assets/images/orang1.jpg'), fit: BoxFit.cover),
    //   ),
    //   ClipOval(
    //     child: Image(
    //         image: AssetImage('assets/images/orang3.jpeg'), fit: BoxFit.cover),
    //   )
    // ],
    accountName: Text(
      name,
      style: TextStyle(
          fontSize: 15,
          color: Colors.deepPurple[50],
          fontWeight: FontWeight.bold),
    ),
    accountEmail: Text(
      email,
      style: TextStyle(
          fontSize: 12,
          color: Colors.deepPurple[50],
          fontWeight: FontWeight.bold),
    ),
  );
}

Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
