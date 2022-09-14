import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:display_plugin/display_plugin_method_channel.dart';

void main() {
  MethodChannelDisplayPlugin platform = MethodChannelDisplayPlugin();
  const MethodChannel channel = MethodChannel('display_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
