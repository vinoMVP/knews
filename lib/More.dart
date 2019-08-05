import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class More extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoreState();
  }
}

class _MoreState extends State<More> {
  static double _icon_size = 24;

  var imageList = [
    Image.asset("images/ic_culture.png", width: _icon_size),
    Image.asset("images/ic_sport.png", width: _icon_size),
    Image.asset("images/ic_fashion.png", width: _icon_size),
    Image.asset("images/ic_shopping.png", width: _icon_size),
    Image.asset("images/ic_estate.png", width: _icon_size)
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("更多"),
        centerTitle: true,
      ),
      body: Center(
        child: (MyHomePage.getTabs() == null
            ? CircularProgressIndicator()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                itemCount: MyHomePage.getTabs().length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new WebviewScaffold(
                            appBar: new AppBar(
                              title: Text(MyHomePage.getTabs()[index].name),
                            ),
                            url: MyHomePage.getTabs()[index].url);
                      }));
                    },
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        imageList[index],
                        Padding(
                          child: Text(MyHomePage.getTabs()[index].name),
                          padding: EdgeInsets.all(3),
                        ),
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
