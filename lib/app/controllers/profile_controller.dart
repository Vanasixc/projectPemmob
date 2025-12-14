import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ProfileController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return null;

    return File(image.path);
  }

  Future<String> saveImage(File imageFile, String nim) async {
    final dir = await getApplicationDocumentsDirectory();

    final fileName = 'profile_${nim}_${p.extension(imageFile.path)}';

    final saveImage = await imageFile.copy('${dir.path}/$fileName');

    return saveImage.path;
  }
}
