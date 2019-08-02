import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Home extends StatefulWidget {
  static String webUrl = "about:blank";

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: new WebviewScaffold(
        url: Home.webUrl,
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
