import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorAndLoaderStateHandler {
  call({
    required RxString errorMessage,
    required RxBool isLoading,
  }) {
    everAll([errorMessage, isLoading], (value) {
      if (value is String && value.isNotEmpty) {
        _closeDialogIfOpen();

        Get.snackbar(
          'Opa, algo deu errado!',
          errorMessage.value,
          backgroundColor: Colors.red,
        );

        errorMessage.value = '';
      }

      if (value is bool) {
        if (value) {
          Get.dialog(
            Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          _closeDialogIfOpen();
        }
      }
    });
  }

  _closeDialogIfOpen() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
