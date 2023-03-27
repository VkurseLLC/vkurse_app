import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'dart:typed_data';
// import 'decode.dart';

class CodeEncode {
  static encodeImageToBinaryString(String imagePath) async {
    try {
      final bytes = await File(imagePath).readAsBytes();
      final encodedBytes = base64Encode(bytes);
      return encodedBytes;
    } catch (e) {
      // print('Failed to encode image: $e');
      return null;
    }
  }

  static Future<Uint8List?> decodeBinaryStringToImage(
      String binaryString) async {
    try {
      final bytes = base64Decode(binaryString);
      var file = Io.File("decoded1.png");
      file.writeAsBytesSync(bytes);
      // print('Image decoded successfully!');
      return Uint8List.fromList(bytes);
    } catch (e) {
      // print('Failed to decode image: $e');
      return null;
    }
  }
}
