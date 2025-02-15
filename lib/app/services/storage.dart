// import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  final List<String> defaultList = [];

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');

    return this;
  }

  String get localData => _runData.read('localData') ?? '';
  set localData(String val) => _runData.write('localData', val);

  void clearData() {
    _runData.erase();
  }
}
