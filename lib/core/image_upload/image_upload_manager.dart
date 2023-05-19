import 'package:image_picker/image_picker.dart';

import 'i_image_upload.dart';

class ImageUploadCustomManager {
  final IimageUploadManager iimageUploadManager;

  ImageUploadCustomManager(this.iimageUploadManager);

  Future<XFile?> cropWithFetch() async {
    return iimageUploadManager.fetch();
  }
}

class LibraryImageUpload extends IimageUploadManager {
  @override
  Future<XFile?> fetch() async {
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }
}

class CameraImageUpload extends IimageUploadManager {
  @override
  Future<XFile?> fetch() async {
    final XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    return image;
  }
}
