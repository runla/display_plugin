
import 'package:display_plugin/package_info_method_channel.dart';
import 'package:flutter/material.dart';

class VersionPage extends StatefulWidget {
  VersionPage({this.dynamicRoute = false, super.key});

  bool dynamicRoute;

  @override
  State<StatefulWidget> createState() => _VersionPage();

}

class _VersionPage extends State<VersionPage> {

  var _versionName = "";
  var _versionCode = "";

  @override
  void initState() {
    super.initState();
    _getPackageInfo();
  }

  Future<void> _getPackageInfo() async {
    var packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _versionCode = packageInfo.buildNumber;
      _versionName = packageInfo.versionName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: <Widget> [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Version Name : $_versionName"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Version Code : $_versionCode")
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("dynamicRoute : ${widget.dynamicRoute}")
          ),

          TextButton(onPressed: (){
            Navigator.pop(context,"Version dynamicRoute=${widget.dynamicRoute}");
          }, child: const Text("点击返回"))
        ],
      ),
    );
  }

  final AppBar _appBar = AppBar(
    title: const Text('版本号'),
    elevation: 0,
  );




}