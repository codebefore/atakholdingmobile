import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

final LocalAuthentication _auth = LocalAuthentication();

Future<bool> checkBiometrics() async {
  try {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;

    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await _auth.isDeviceSupported();
    if (!canAuthenticate) {
      return false;
    }

    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      if (availableBiometrics.contains(BiometricType.face) ||
          availableBiometrics.contains(BiometricType.fingerprint)) {
        return true;
      }
    }
    return false;
  } on PlatformException catch (_) {
    return false;
  }
}

Future<bool> authenticateUser() async {
  try {
    final bool didAuthenticate = await _auth.authenticate(
      localizedReason: 'Please authenticate to log in',
      options: const AuthenticationOptions(
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
      ),
    );

    return didAuthenticate;
  } on PlatformException catch (e) {
    return false;
  }
}
