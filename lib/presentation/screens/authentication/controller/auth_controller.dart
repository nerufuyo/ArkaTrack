class AuthController {
  void disposeControllers(controllers) {
    for (var element in controllers) {
      element.dispose();
    }
  }
}
