import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/model.dart';
import '../widgets/dayWidgets.dart';

class DayScreen extends StatelessWidget {
  static const routeName = '/dayscreen';
  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context).settings.arguments as Map;
    var days = task['days'];
    // print(task['days']);
    // final maindata = Provider.of<Data>(context).stages;
    // var data = maindata.map((e) => e.id);
    // print(data);
    // print(maindata);

    //final id = task['id'];
    //final extractedData = Provider.of<Data>(context).stages;
    ////final day = extractedData.elementAt(id).days;
    //final days = task['days'] as Map;
    //final days = Provider.of<Data>(context).days;
    //final weekday = Provider.of<Data>(context).weekdays.elementAt(id);
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 22 * curScaleFactor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(task['title']),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/dayscreen.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child:
                // GridView(
                //   children:,
                //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //     maxCrossAxisExtent: 150,
                //     childAspectRatio: 3/2,
                //     crossAxisSpacing: 20,
                //     mainAxisSpacing: 20
                //     ),
                //     ),
                GridView.builder(
              itemCount: days.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3 / 2,
                  crossAxisCount: 2),
              itemBuilder: (ctx, i) => DayWidget(days[i].title, days[i].task
                  // task['days'][i],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
