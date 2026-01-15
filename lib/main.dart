import 'ecommerce.dart';
import 'core/services/services.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const Ecommerce());
}
