import 'package:flutter/material.dart';

import 'config/Env.dart';

void main() => Development();

class Development extends Env {
  final String appName = "Flutter Starter Dev";
  final String baseUrl = 'https://api.dev.website.org';
  final Color primarySwatch = Colors.pink;
  EnvType environmentType = EnvType.DEVELOPMENT;

  final String dbName = 'flutterStarter-Dev.db';

}