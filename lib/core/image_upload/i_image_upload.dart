import 'package:image_picker/image_picker.dart';

abstract class IimageUploadManager {
  Future<XFile?> fetch();
  final ImagePicker imagePicker = ImagePicker();
}
