import 'package:flutter/material.dart';
import 'package:privshare/core/routes/routes.dart';
import 'package:privshare/core/theme.dart';

void main() async {
  // INIT

  runApp(
    MaterialApp(
      initialRoute: Routes.LOGIN,
      // initialRoute: Routes.LOGIN.path,
      theme: Themes.light,
      darkTheme: Themes.dark,
      routes: Routes.routes(),
    ),
  );
}
