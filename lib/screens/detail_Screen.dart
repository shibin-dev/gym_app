import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskDetailScreen extends StatelessWidget {
  static const routeName = 'detailScreen';
  @override
  Widget build(BuildContext context) {
    final detailData = ModalRoute.of(context).settings.arguments as Map;
    final appBar = AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 22,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(detailData['title']),
    );
    final mediaQuery = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    //final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        appBar: appBar,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/dayscreen.jpg', fit: BoxFit.fill),
            ),
            Column(
              children: [
                Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              //MediaQuery.of(context).size.width * 2,
                              //left: MediaQuery.of(context).size.width * 2
                            ),
                            width: MediaQuery.of(context).size.width * .6,
                            height: mediaQuery * .3,
                            decoration: BoxDecoration(
                                border: Border.all(width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              detailData['gif'],
                              fit: BoxFit.cover,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                var url = detailData['videoUrl'];
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Card(
                                  color: Colors.black,
                                  elevation: 10,
                                  //margin: EdgeInsets.only(right: 40, top: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_circle_fill_sharp,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          'Sample Video',
                                          style:
                                              TextStyle(color: Colors.yellow),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        )
                      ]),
                ),
                SizedBox(height: mediaQuery * .05),
                Text(
                  detailData['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: mediaQuery * .05,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * .8,
                  height: mediaQuery * .3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  //height: MediaQuery.of(context).size.height * .4,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Text(
                          detailData['details'],
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            )
          ],
        ));
  }
}
