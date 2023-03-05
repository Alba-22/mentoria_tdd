import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tunefy/app/utils/env_vars.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: EnvVars.previewEnabled,
      builder: (_) {
        return ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        );
      },
    ),
  );
}
