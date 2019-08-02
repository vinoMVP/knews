import 'package:flutter/material.dart';
import 'Home.dart';
import 'More.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'TabData.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const double _icon_padding = 3;
  static const double _icon_width = 24;
  static const double _icon_height = 24;

  var _childList;
  var dio;
  List<TabContent> tabs;

  @override
  void initState() {
    super.initState();
//    _childList = [new Home(), new Discover(), new Post(), new More()];
    _childList = [new Home(), new More()];
    dio = new Dio();
  }

  @override
  Widget build(BuildContext context) {
    getTabs();
    return Scaffold(
      body: _childList[_selectedIndex <= 2 ? 0 : 1],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.all(_icon_padding),
                child: Image.asset("images/icon_homepage_press.png",
                    width: _icon_width, height: _icon_height),
              ),
              icon: Padding(
                padding: EdgeInsets.all(_icon_padding),
                child: Image.asset("images/icon_homepage_release.png",
                    width: _icon_width, height: _icon_height),
              ),
              title: Text("热点新闻")),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.all(_icon_padding),
                child: Image.asset("images/icon_discover_press.png",
                    width: _icon_width, height: _icon_height),
              ),
              icon: Padding(
                padding: EdgeInsets.all(_icon_padding),
                child: Image.asset("images/icon_discover_release.png",
                    width: _icon_width, height: _icon_height),
              ),
              title: Text("推荐新闻")),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.all(_icon_padding),
                child: Image.asset("images/icon_post_press.png",
                    width: _icon_width, height: _icon_height),
              ),
              icon: Padding(
                padding: EdgeInsets.all(_icon_padding),
                child: Image.asset("images/icon_post_release.png",
                    width: _icon_width, height: _icon_height),
              ),
              title: Text("本地新闻")),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.all(_icon_padding),
                child: Image.asset("images/icon_more.png",
                    width: _icon_width, height: _icon_height),
              ),
              icon: Padding(
                padding: EdgeInsets.all(_icon_padding),
                child: Image.asset("images/icon_more_release.png",
                    width: _icon_width, height: _icon_height),
              ),
              title: Text("更多")),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex <= 2) {
        var plugin = new FlutterWebviewPlugin();
        plugin.reloadUrl(tabs[_selectedIndex].url);
        print("url:${tabs[_selectedIndex].url}");
      }
    });
  }

  Future getTabs() async {
    FormData formData = new FormData.from({
      "cid": "1004_1101_08900100",
      "param": "tabs",
    });
    Response response = await dio.post(
        "http://api.control.kylienet.com:666/v1/config/funclist",
        data: formData);
    Map<String, dynamic> map =
        json.decode(response.data.toString().replaceFirst("tabs", "\"tabs\""));
//    print("map:$map");
    var tabData = TabData.fromJson(map["tabs"]);
    tabs = tabData.data;
    setState(() {
      if (_selectedIndex <= 2) {
        Home.webUrl = tabs[_selectedIndex].url;
      }
//      Discover.webUrl = tabs[1].url;
//      Post.webUrl = tabs[2].url;
    });
  }
}
