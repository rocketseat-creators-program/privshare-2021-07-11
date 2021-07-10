import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorAndLoaderStateHandler {
  call({
    required RxString errorMessage,
    required RxBool isLoading,
  }) {
    everAll([errorMessage, isLoading], (value) {
      if (value is String && value.isNotEmpty) {
        _closeLoaderIfOpen();

        if (Get.isSnackbarOpen!) {
          Get.back();
        }

        Get.snackbar(
          'Opa, algo deu errado!',
          value,
          backgroundColor: Colors.red,
        );

        errorMessage.value = '';
      } else if (value is bool) {
        if (value) {
          Get.dialog(
            Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          _closeLoaderIfOpen();
        }
      }
    },
        condition: (value) =>
            (value is String && value.isNotEmpty) || value is bool);
  }

  _closeLoaderIfOpen() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
