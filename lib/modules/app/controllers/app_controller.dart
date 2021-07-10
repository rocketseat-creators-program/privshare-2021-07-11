import 'package:get/get.dart';
import 'package:privshare/core/handlers/error_and_loader_state_handler.dart';

class AppController extends GetxController {
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;

  final ErrorAndLoaderStateHandler handler;

  AppController(this.handler);

  @override
  void onInit() {
    handler(
      errorMessage: _errorMessage,
      isLoading: _isLoading,
    );

    super.onInit();
  }

  setErrorMessage(String errorMessage) {
    _errorMessage.value = errorMessage;
    _isLoading.value = false;
  }

  setIsLoading(bool isLoading) => _isLoading.value = isLoading;
}
