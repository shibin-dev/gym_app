import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/widgets/drawer.dart';
import 'package:workout_app/widgets/mainscreenWidgets.dart';
import '../providers/model.dart';
//import '../screens/dayScreen.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final stage = Provider.of<Data>(context).stages;
    return SafeArea(
          child: Scaffold(
            key: _globalKey,
         drawer: Drawer(
           child: AppDrawer(),
          ),
          body: Stack(
        children: [
          Container(
            height: mediaQuery.height,
            width: mediaQuery.width,
            child: Image.asset(
              'assets/gymbackground.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
              height: mediaQuery.height,
              width: mediaQuery.width,
              child:
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children:
                  ListView.builder(
                      itemCount: stage.length,
                      itemBuilder: (ctx, i) =>
                          MainWidget(stage[i].name, stage[i].days))

              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).pushNamed(DayScreen.routeName);
              //   },
              //   child: Container(
              //     height: 100,
              //     width: 100,
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle, color: Colors.black),
              //     child: Center(
              //         child: Text(
              //       'Intermediate',
              //       style: Theme.of(context).textTheme.headline6,
              //     )),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).pushNamed(DayScreen.routeName);
              //   },
              //   child: Container(
              //     height: 100,
              //     width: 100,
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle, color: Colors.black),
              //     child: Center(
              //         child: Text(
              //       'Advanced',
              //       style: Theme.of(context).textTheme.headline6,
              //     )),
              //   ),
              // )

              ),
          Positioned(
            top: mediaQuery.height * .06,
            left: mediaQuery.width * .06,
            child: Container(
              height: mediaQuery.height * .08,
              width: mediaQuery.width * .08,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 5, color: Colors.black87),
              //     //borderRadius: BorderRadius.circular(20)
              //     shape: BoxShape.circle),
              child: IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                color: Colors.black,
                size: mediaQuery.width * .08,
                ),
                onPressed: (){
                 _globalKey.currentState.openDrawer();
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
