import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoreState();
  }
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text("more"),
      ),
    );
  }
}
