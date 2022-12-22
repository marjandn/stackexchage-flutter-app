import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stackexchange_app/src/di/di.dart';

NetworkStatus networkStatus = NetworkStatus.offline;

class ConnectionStatus {
  static Future<void> _firstInit() async {
    var status = await injector<Connectivity>().checkConnectivity();
    networkStatus = (status == ConnectivityResult.mobile || status == ConnectivityResult.wifi)
        ? networkStatus = NetworkStatus.online
        : networkStatus = NetworkStatus.offline;
  }

  ConnectionStatus._create() {
    injector<Connectivity>().onConnectivityChanged.listen(
          (event) => (event == ConnectivityResult.mobile || event == ConnectivityResult.wifi)
              ? networkStatus = NetworkStatus.online
              : networkStatus = NetworkStatus.offline,
        );
  }

  static Future<void> startMonitoring() async {
    await _firstInit();
    ConnectionStatus._create();
  }
}

enum NetworkStatus { online, offline }
