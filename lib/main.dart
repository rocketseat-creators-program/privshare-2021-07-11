import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:privshare/core/routes/routes.dart';
import 'package:privshare/core/theme.dart';
import 'package:privshare/modules/app/bindings/app_binding.dart';

void main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      initialRoute: Routes.LOGIN,
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialBinding: AppBinding(),
      getPages: Routes.pages,
    ),
  );
}
