import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //============start snkBar===============

  final snakBarkey = GlobalKey<ScaffoldState>();

  snakBar({
    String text,
  }) {
    final sBar = SnackBar(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      duration: Duration(seconds: 3),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
    snakBarkey.currentState.showSnackBar(sBar);
  }
  //============end snkBar===============
  //============start DatePicker===============

  DateTime dateNew;
  void _showDateTimeDialog() async {
    var datee = await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(2000),
            lastDate: DateTime(2022))
        .then((value) => {
              setState(() {
                dateNew = value;
                snakBar(
                  text:
                      "Date New : ${dateNew.year} / ${dateNew.month} / ${dateNew.day} ",
                );
              })
            });
  }

  //============end DatePicker===============
  //============start TimePicker===============

  TimeOfDay timeNew;

  void _showTimeDialog() async {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now())
            .then((value) {
      setState(() {
        timeNew = value;
        snakBar(
          text: "Time New : ${timeNew.hour}:${timeNew.minute}",
        );
      });
    });
  }
  //============end TimePicker===============

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // =====> key show SnakBar
      key: snakBarkey,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DSC Alzahr"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: 180,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(89),
              color: Colors.teal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Date  Now:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(height: 10),
                Text(
                  dateNew == null
                      ? ""
                      : "${dateNew.year} / ${dateNew.month} / ${dateNew.day}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(height: 10),
                Text(
                  "Time Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(height: 10),
                Text(
                  timeNew == null ? "" : "${timeNew.hour}:${timeNew.minute}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(height: 10),
                InkWell(
                  child: Text(
                    "Set Time And Date",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  onTap: () {
                    _showDateTimeDialog();
                    _showTimeDialog();
                  },
                  splashColor: Colors.red,
                ),
                SizedBox(height: 5),
                //  Text("___________________________",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
