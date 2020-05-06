import 'package:flutter/material.dart';
import 'detail.dart';


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
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