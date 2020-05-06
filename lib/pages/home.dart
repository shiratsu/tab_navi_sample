import 'package:flutter/material.dart';
import 'detail.dart';


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Home'),
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