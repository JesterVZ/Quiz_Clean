import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetConnectionClient {
  Future<bool> checkConnection();
}

class InternetConnectionClientImpl implements InternetConnectionClient {
  final InternetConnectionChecker connectionChecker;
  InternetConnectionClientImpl(this.connectionChecker);

  @override
  Future<bool> checkConnection() async {
    throw UnimplementedError();
  }
}
