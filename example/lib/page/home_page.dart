
import 'package:display_plugin_example/page/routers.dart';
import 'package:display_plugin_example/page/version_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        color: const Color(0xfff2f2f2),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var itemText = map.keys.toList()[index];
            var routeName = map.values.toList()[index];
            debugPrint("itemText=$itemText routeName=$routeName");
            return InkWell(
              onTap: () {
                if(index == 0) {
                  // 动态路由
                  toVersionPage();
                  return;
                }

                // 静态路由: 带参数
                if(routeName == versionPage) {
                  toVersionPageStatic(routeName);
                  return;
                }

                // 静态路由
                toPage(routeName);
                debugPrint('onTap: index=$index itemText=$itemText');
              },
              child: Container(
                margin: const EdgeInsets.only(top: 1),
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(5),
                height: 50,
                child: Text(itemText),
              ),
            );
          },
          itemCount: map.length,
        ),
      ),
    );
  }

  toVersionPage() async {
    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return VersionPage(dynamicRoute: true);
    }));
    debugPrint('路由结果：$result');
  }


  toVersionPageStatic(String routeName) async {
    var result = await Navigator.of(context).pushNamed(routeName, arguments: false);
    debugPrint('路由结果：$result');
  }


  toPage(String routeName) async {
    var result = await Navigator.of(context).pushNamed(routeName);
    debugPrint('路由结果：$result');
  }


  final AppBar _appBar = AppBar(
    title: const Text('首页'),
    elevation: 0,
  );


  Map<String, String> map = {
    "动态路由": "",
    "查看版本号": versionPage,
    "变量": varPage,
    "函数": functionPage,
    "类": classPage,
    "异步任务": asyncPage,
    "文本组件": textWidgetPage,
    "基础组件": baseWidgetPage,
    "布局组件": layoutWigetPage,
    "装饰组件": decoratePage,
  };

}