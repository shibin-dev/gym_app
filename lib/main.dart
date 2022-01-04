import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/providers/auth.dart';
import 'package:workout_app/screens/authScreen.dart';
import 'package:workout_app/screens/splashScreen.dart';
import './screens/detail_Screen.dart';
import './providers/model.dart';
import './screens/dayScreen.dart';
import './screens/task_screen.dart';
import './screens/mainscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Data(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx,auth,_){
          return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.yellow,
            primaryColor: Colors.black,
            accentColor: Colors.amber,
            fontFamily: 'Main Text',
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'Main Text',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 1,
                    color: Colors.white),
                headline5: TextStyle(
                    fontFamily: 'Day Text',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white),
                bodyText1: TextStyle(
                    fontFamily: 'App Text',
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.white)),
            appBarTheme: AppBarTheme(
              //backgroundColor: Colors.white,
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
            )),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Gym',
        home: auth.isAuth ? MainScreen():FutureBuilder(
          future: auth.tryAutoLogin(),
          builder: (context,snapshot) => 
          snapshot.connectionState == ConnectionState.waiting 
          ? SplashScreen()
          : AuthScreen(),
          ),
        //MainScreen(),
        routes: {
          AuthScreen.routeName:(ctx) => AuthScreen(),
          DayScreen.routeName: (ctx) => DayScreen(),
          TaskScreen.routeName: (ctx) => TaskScreen(),
          TaskDetailScreen.routeName: (ctx) => TaskDetailScreen(),
          //VideoApp.routeName: (ctx) => VideoApp()
        },
      );
        },
      )
    );
  }
}
