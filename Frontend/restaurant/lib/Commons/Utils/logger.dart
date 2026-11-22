class Logger {
  static write(String text, {isError = false}) {
    return Future.microtask(() => print(" **BANDE $text, isError=[$isError]"));
  }
}
