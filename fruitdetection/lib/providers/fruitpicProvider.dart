import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageFileProvider = StateProvider<XFile?>((ref) => null);
final fruitNameProvider = StateProvider<String>((ref) => '');
