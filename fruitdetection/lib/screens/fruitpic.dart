import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruitdetection/providers/fruitpicProvider.dart';
import 'package:image_picker/image_picker.dart';

class Fruitpic extends ConsumerWidget {
  const Fruitpic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imageFileProvider);
    final fruitName = ref.watch(fruitNameProvider);
    final ImagePicker _picker = ImagePicker();
    // Future<void> _pickFromCamera() async {
    //   final image = await _picker.pickImage(source: ImageSource.camera);
    //   if (image != null) {
    //     ref.read(imageFileProvider.notifier).state = image;
    //   }
    // }

    Future<void> _pickFromGallery() async {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        ref.read(imageFileProvider.notifier).state = image;
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: _pickFromGallery,
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: Colors.grey,
                  strokeWidth: 2,
                  dashPattern: const [10, 5],
                  radius: const Radius.circular(10),
                  padding: const EdgeInsets.all(7),
                ),

                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.grey,
                            ),
                            const Center(
                              child: Text(
                                'Capture Image Here',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Image.file(File(image.path), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          ref.read(fruitNameProvider.notifier).state != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Fruit Name: ${ref.read(fruitNameProvider)}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )
              : const SizedBox(height: 20),
          // pic image
          // FILE PICKER WIDGET
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            onPressed: () {
              ref.read(fruitNameProvider.notifier).state =
                  'Mango'; // Example fruit name
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
