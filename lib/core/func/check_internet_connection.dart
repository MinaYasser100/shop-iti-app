import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    // I am connected to a mobile network.
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    // I am connected to a wifi network.
    return true;
  }
  return false;
}
