import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_remote_config/remote/remote_constants.dart';

class FireRemoteConfig {
  late FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteConfig get remoteConfig => _remoteConfig;

  FireRemoteConfig() {
    print('FirebaseAppRemoteConfig => init');
    _init();
  }

  Future _init() async {
    _remoteConfig = FirebaseRemoteConfig.instance;
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      minimumFetchInterval: const Duration(minutes: 1),
      fetchTimeout: const Duration(minutes: 5),
    ));

    await _remoteConfig.setDefaults(RemoteConstants.defaultValues);

    await _remoteConfig.fetchAndActivate();
  }
}
