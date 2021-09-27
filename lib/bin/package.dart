#!/usr/bin/env dart

import 'dart:io';

Future<void> main(List<String> args) async {
  String description = '''

  https://dartevel.com

  dartevel package  ''';

  var runner = CommandRunner("dartevel", description)
    ..addCommand(VersionCommand());

  runner.argParser.addFlag('verbose',
      help: 'Print verbose output.', negatable: false, abbr: 'v');

  return await runner.run(args).onError((error, stackTrace) {
    stderr.writeln('Error -- something went wrong: $error');
    if (args.contains('--verbose') || args.contains('-v')) {
      stderr.writeln(stackTrace);
    }
  }).whenComplete(() => null);
}
