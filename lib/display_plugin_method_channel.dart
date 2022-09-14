import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'display_plugin_platform_interface.dart';

/// An implementation of [DisplayPluginPlatform] that uses method channels.
class MethodChannelDisplayPlugin extends DisplayPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('display_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
