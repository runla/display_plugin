


import 'package:display_plugin_example/page/base_widget_page.dart';
import 'package:display_plugin_example/page/class_page.dart';
import 'package:display_plugin_example/page/decorate_widget_page.dart';
import 'package:display_plugin_example/page/function_page.dart';
import 'package:display_plugin_example/page/layout_widget_page.dart';
import 'package:display_plugin_example/page/text_widget_page.dart';
import 'package:display_plugin_example/page/var_page.dart';
import 'package:display_plugin_example/page/version_page.dart';
import 'package:flutter/material.dart';

import 'async_page.dart';
import 'home_page.dart';

/// 主页面
const homePage = "/home";

/// Version Page
const versionPage = "/version";


/// Version Page
const varPage = "/var";
const functionPage = "/function";
const classPage = "/class";
const asyncPage = "/async";
const textWidgetPage = "/text";
const layoutWigetPage = "/layout";
const decoratePage = "/decorate";
const baseWidgetPage = "/base_widget";

typedef WidgetSetingBuilder = Widget Function(BuildContext context, Object? arguments);

final Map<String, WidgetSetingBuilder> routesArguments = {
  versionPage: (context, arguments) {
    // debugPrint("router arguments=${arguments ?? ""}");
    // var dynamicRoute = arguments as bool?;
    return VersionPage(dynamicRoute: false);
  },
};

final Map<String, WidgetBuilder> routes = {
  // versionPage: (context) => VersionPage(),
  homePage: (context) => const HomePage(),
  varPage: (context) => const VarPage(),
  functionPage: (context) => const FunctionPage(),
  classPage: (context) => const ClassPage(),
  asyncPage: (context) => const AsyncPage(),
  textWidgetPage: (context) => const TextWidgetPage(),
  baseWidgetPage: (context) => const BaseWidgetPage(),
  layoutWigetPage: (context) => const LayoutWidgetPage(),
  decoratePage: (context) => const DecorateWidgetPage(),
};

Route<dynamic>? Function(RouteSettings) onGenerateRoute =
    (RouteSettings settings) {
  Object? arguments = settings.arguments;
  String? name = settings.name;

  debugPrint("router name=$name arguments=$arguments");
  // 处理不带参数的页面跳转
  if (routes.keys.contains(name)) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => routes[name]!(context),
    );
  } else if(routesArguments.keys.contains(name)){
    // 处理带参数的页面跳转
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => routesArguments[name]!(context, arguments),
    );
  }

};