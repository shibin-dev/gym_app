import 'package:flutter/material.dart';
import '../providers/model.dart';
import '../screens/dayScreen.dart';

class MainWidget extends StatelessWidget {
  final String title;
  final List<Day> days;
  // final List<Day> days;
  MainWidget(this.title, this.days);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(DayScreen.routeName,
            arguments: {'title': title, 'days': days});
      },
      child: Container(
        margin: const EdgeInsets.all(58),
        height: mediaQuery.height * .16,
        width: mediaQuery.width * .16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        )),
      ),
    );
  }
}
