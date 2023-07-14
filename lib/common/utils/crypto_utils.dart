import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'logger.dart';

const _usage = 'Usage: dart hash.dart <md5|sha1|sha256> <input_filename>';

/// Use MD5
String cryptoMD5(String data) {
  Uint8List content = const Utf8Encoder().convert(data);
  Digest digest = md5.convert(content);
  return digest.toString();
}

Future<void> osstpCrypto(List<String> args) async {
  if (args.length != 2) {
    osstpLoggerNoStack.d(_usage);
    exitCode = 64; // Command was used incorrectly.
    return;
  }

  Hash hasher;

  switch (args[0]) {
    case 'md5':
      hasher = md5;
      break;
    case 'sha1':
      hasher = sha1;
      break;
    case 'sha256':
      hasher = sha256;
      break;
    default:
      exitCode = 64; // Command was used incorrectly.
      return;
  }

  var filename = args[1];
  var input = File(filename);

  if (!input.existsSync()) {
    exitCode = 66; // An input file did not exist or was not readable.
    return;
  }

  var value = await hasher.bind(input.openRead()).first;
}
