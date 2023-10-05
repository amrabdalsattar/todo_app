import 'package:assignment_five_flutter/app.dart';
import 'package:assignment_five_flutter/utils/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
    child: const MyApp(),
  ));
}
