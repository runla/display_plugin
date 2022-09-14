import 'package:flutter_test/flutter_test.dart';
import 'package:display_plugin/display_plugin.dart';
import 'package:display_plugin/display_plugin_platform_interface.dart';
import 'package:display_plugin/display_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDisplayPluginPlatform
    with MockPlatformInterfaceMixin
    implements DisplayPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DisplayPluginPlatform initialPlatform = DisplayPluginPlatform.instance;

  test('$MethodChannelDisplayPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDisplayPlugin>());
  });

  test('getPlatformVersion', () async {
    DisplayPlugin displayPlugin = DisplayPlugin();
    MockDisplayPluginPlatform fakePlatform = MockDisplayPluginPlatform();
    DisplayPluginPlatform.instance = fakePlatform;

    expect(await displayPlugin.getPlatformVersion(), '42');
  });
}
