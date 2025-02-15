import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/app/modules/home/widget/add_task.dart';
import 'package:mytodo/app/services/storage.dart';

import '../model/todo_model.dart';

class HomeController extends GetxController {
  RxList<TodoModel> activeList = <TodoModel>[].obs;
  RxList<TodoModel> completedList = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    assingStorageDataToList();
  }

  void addTask() {
    // assingStorageToList();
    Get.bottomSheet(AddTask(
      onAddTask: (newTask) {
        activeList.insert(0, newTask);
        addDataToStorage();
      },
    ), backgroundColor: Color.fromARGB(255, 16, 46, 59).withOpacity(0.9));
  }

  void addDataToStorage() {
    String data = jsonEncode(activeList.map((e) => e.toJson()).toList());
    Get.find<GetStorageService>().localData = data;
  }

  void updateList(int index) {
    activeList[index].status = !(activeList[index].status ?? false);
    activeList.sort((a, b) => a.status ?? false ? 1 : 0);
    activeList.refresh();
    addDataToStorage();
  }

  void deleteTask(int index) {
    activeList.removeAt(index);

    activeList.refresh();
    addDataToStorage();
  }

  void assingStorageDataToList() {
    String rawData = Get.find<GetStorageService>().localData;
    if (rawData.isNotEmpty) {
      List<dynamic> data = jsonDecode(rawData);
      activeList.value = data.map((e) => TodoModel.fromJson(e)).toList();
      // completedList.value = data.map((e) => TodoModel.fromJson(e)).toList();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
