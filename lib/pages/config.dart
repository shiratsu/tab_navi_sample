import 'package:flutter/material.dart';
import 'detail.dart';

class Config extends StatelessWidget {
  const Config({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Config"),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Config'),
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