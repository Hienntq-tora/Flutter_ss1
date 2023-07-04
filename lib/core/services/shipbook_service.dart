import 'package:flutter/foundation.dart';
import 'package:shipbook/shipbook.dart';

class ShipBookService {
  ShipBookService({required this.shipBookAppId, required this.shipBookToken});

  final String shipBookAppId;
  final String shipBookToken;

  void initialize() {
    if (kDebugMode) {
      Shipbook.start(
        shipBookAppId,
        shipBookToken,
      );
    }
  }
}
