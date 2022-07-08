import 'package:spicywhips/util/storage.dart';

class UserCred {
  bool isUserLogin() {
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive == '' ? false : true;
  }

  String getUserId() {
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getUserToken() {
    String isActive = StorageUtil.getString('TOKEN');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getUserFilledInfo() {
    String isActive = StorageUtil.getString('INFO');
    return isActive;
  }

  String getUserUploadPhoto() {
    String isActive = StorageUtil.getString('PHOTO');
    return isActive;
  }

  void addUserId(String id) {
    StorageUtil.putString('USERID', id);
  }

  void addUserToken(String id) {
    StorageUtil.putString('TOKEN', id);
  }

  void setUserFilledInfo(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setUserUploadPhoto(String info) {
    StorageUtil.putString('PHOTO', info);
  }

  void logoutUser() {
    StorageUtil.putString('USERID', '');
    StorageUtil.putString('INFO', '');
    StorageUtil.putString('PHOTO', '');
    StorageUtil.clearAll();
  }
}

final userCred = UserCred();
