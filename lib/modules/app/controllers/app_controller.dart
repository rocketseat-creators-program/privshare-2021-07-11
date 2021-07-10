import 'package:privshare/core/handlers/error_and_loader_state_handler.dart';

class AppController {
  bool _isLoading = false;
  String _errorMessage = '';

  final ErrorAndLoaderStateHandler handler;

  AppController(this.handler) {
    handler();
  }

  setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    _isLoading = false;
  }

  setIsLoading(bool isLoading) => _isLoading = isLoading;
}
