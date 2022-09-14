
import 'package:flutter/services.dart';

class PackageInfo {

  PackageInfo({
    required this.appName,
    required this.packageName,
    required this.versionName,
    required this.buildNumber,
  });


  final String appName;
  final String packageName;
  final String versionName;
  final String buildNumber;


  static PackageInfo? _fromPlatform;

  static Future<PackageInfo> fromPlatform() async {
    if (_fromPlatform != null) {
          return _fromPlatform!;
    }
    MethodChannel kChannel = MethodChannel('com.mindlinker/package_info');
    try {
      final Map<dynamic, dynamic>? map = await kChannel.invokeMethod<Map<dynamic,dynamic>>('getPackageInfo');
      _fromPlatform = PackageInfo(
        appName: map!["appName"],
        packageName: map["packageName"],
        versionName: map["version"],
        buildNumber: map["buildNumber"],
      );
    } catch (e) {
      _fromPlatform = PackageInfo(
        appName: "1.0.0",
        packageName: "name",
        versionName: "1.0.0",
        buildNumber: "1",
      );
    }

    return _fromPlatform!;
  }

}