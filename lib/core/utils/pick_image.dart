import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


Future<Uint8List?> pickImage(BuildContext context) async {
  Uint8List? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = await pickedImage.readAsBytes();
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    showSnackBar(context: context, content: e.toString());
  }
  return image;
}

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}