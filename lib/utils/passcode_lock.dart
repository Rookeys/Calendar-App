import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';

Future<void> passcodeLock(BuildContext context) {
  return screenLock(
    context: context,
    correctString: '1234',
    onUnlocked: () {
      context.pushReplacement('/');
    },
    title: const Text('passcode'),
    config: const ScreenLockConfig(
      backgroundColor: CustomColor.skyBlue,
      titleTextStyle: TextStyle(fontSize: 24),
    ),
    secretsConfig: SecretsConfig(
      spacing: 15, // or spacingRatio
      padding: const EdgeInsets.all(40),
      secretConfig: SecretConfig(
        borderColor: CustomColor.white,
        borderSize: 2.0,
        disabledColor: CustomColor.darkGray,
        enabledColor: CustomColor.white,
        size: 15,
        builder: (context, config, enabled) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: enabled ? config.enabledColor : config.disabledColor,
            border: Border.all(
              width: config.borderSize,
              color: config.borderColor,
            ),
          ),
          padding: const EdgeInsets.all(10),
          width: config.size,
          height: config.size,
        ),
      ),
    ),
    keyPadConfig: KeyPadConfig(
      clearOnLongPressed: true,
      actionButtonConfig: KeyPadButtonConfig(
        buttonStyle: OutlinedButton.styleFrom(
          foregroundColor: CustomColor.white,
          shape: const CircleBorder(), // Change this line
          side: const BorderSide(
            color: CustomColor.white,
            width: 2,
          ),
        ),
      ),
      buttonConfig: KeyPadButtonConfig(
        buttonStyle: OutlinedButton.styleFrom(
          foregroundColor: CustomColor.white,
          shape: const CircleBorder(), // Change this line
          side: const BorderSide(
            color: CustomColor.white,
            width: 2,
          ),
        ),
      ),
    ),
    cancelButton: const Icon(Icons.close, color: Colors.white),
  );
}
