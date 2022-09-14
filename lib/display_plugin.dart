

import 'display_plugin_platform_interface.dart';

class DisplayPlugin {
  Future<String?> getPlatformVersion() {
    return DisplayPluginPlatform.instance.getPlatformVersion();
  }


}
