import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/router/app_router.dart';
import 'config/theme/util.dart';
import 'config/theme/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Lexend", "Lexend");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: theme.light()
    );
  }
}