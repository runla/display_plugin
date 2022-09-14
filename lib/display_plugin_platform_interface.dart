import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'display_plugin_method_channel.dart';

abstract class DisplayPluginPlatform extends PlatformInterface {
  /// Constructs a DisplayPluginPlatform.
  DisplayPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static DisplayPluginPlatform _instance = MethodChannelDisplayPlugin();

  /// The default instance of [DisplayPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelDisplayPlugin].
  static DisplayPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DisplayPluginPlatform] when
  /// they register themselves.
  static set instance(DisplayPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
