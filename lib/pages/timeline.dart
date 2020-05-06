import 'package:flutter/material.dart';
import 'detail.dart';


class TimeLine extends StatelessWidget {
  const TimeLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TimeLine"),
      ),
      body: Center(
        child: FlatButton(
          child: Text('TimeLine'),
          color: Colors.amberAccent,
          onPressed: () {
            Navigator.of(context).push<Widget>(
              MaterialPageRoute(
                builder: (context) {
                  return Detail();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}