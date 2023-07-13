import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MineProfileController extends SuperController {
  final ImagePicker picker = ImagePicker();
  List<XFile> imageFileList = <XFile>[].obs;
  dynamic pickImageError;

  void setImageFileListFromFile(XFile? value) {
    imageFileList = value == null ? [] : <XFile>[value];
    update();
  }

  void setPickImageError(dynamic e) {
    pickImageError = e;
    update();
  }


  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
