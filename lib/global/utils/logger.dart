import 'package:logger/logger.dart';

Logger logIt({LogFilter? logFilter, LogPrinter? printer, LogOutput? output}) {
  var logIt = Logger(
    filter:
        logFilter, // AllowLogsOnReleaseFilter(), // Use the default LogFilter (-> only log in debug mode)

    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log

    output: output, // Use the default LogOutput (-> send everything to console)
  );

  return logIt;
}

class AllowLogsOnReleaseFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
