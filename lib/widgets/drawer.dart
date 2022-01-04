import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/providers/auth.dart';
import 'package:workout_app/screens/authScreen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('BodyFit',
            style: TextStyle(color: Colors.black),
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout',style: TextStyle(color: Colors.black),),
            onTap: () {
              //Navigator.of(context).pop();
               Navigator.of(context).pushReplacementNamed(
                 AuthScreen.routeName
               );
              
              // // Navigator.of(context)
              // //     .pushReplacementNamed(UserProductsScreen.routeName);
               Provider.of<Auth>(context, listen: false).logout();
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
