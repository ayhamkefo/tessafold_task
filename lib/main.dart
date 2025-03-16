import 'package:flutter/material.dart';

import 'core/utils/colors.dart';
import 'core/utils/routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routers.router,
      locale: const Locale("ar"),
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.backgroundColor),
          useMaterial3: true,
          fontFamily: 'Cairo'),
    );
  }
}
