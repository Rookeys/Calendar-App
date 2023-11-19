import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/passcode_lock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool _isAuthenticating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.skyBlue,
      body: SafeArea(
          child: Center(
        child: FutureBuilder(
            future: _getAvailableBiometrics(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome back',
                      style: TextStyle(fontSize: 38, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (snapshot.data.contains(BiometricType.face))
                      IconButton(
                        icon: SvgPicture.asset('assets/svgs/face_id.svg',
                            height: 100,
                            width: 100,
                            colorFilter: const ColorFilter.mode(
                              CustomColor.white,
                              BlendMode.srcIn,
                            )),
                        onPressed: _authenticateWithBiometrics,
                      ),
                    if (snapshot.data.contains(BiometricType.fingerprint))
                      IconButton(
                        icon: const Icon(
                          Icons.fingerprint,
                          size: 100,
                          color: CustomColor.white,
                        ),
                        onPressed: _authenticateWithBiometrics,
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        passcodeLock(context);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColor.skyBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(
                                          color: CustomColor.white,
                                          width: 2)))),
                      child: const Text('Login with Passcode',
                          style: TextStyle(
                              fontSize: 20, color: CustomColor.white)),
                    ),
                  ],
                );
              }
            }),
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException {
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    if (!mounted) {
      return;
    }

    if (authenticated) {
      context.pushReplacement('/');
    }
  }

  Future<List<BiometricType>> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;

    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException {
      availableBiometrics = <BiometricType>[];
    }
    if (!mounted) {
      return [];
    }

    return availableBiometrics;
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
