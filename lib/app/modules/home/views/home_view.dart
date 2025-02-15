import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mytodo/app/modules/home/widget/todo_tile.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 16, 46, 59),
          onPressed: controller.addTask,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 16, 46, 59),
          title: Row(
            children: [
              Icon(Icons.list_alt_sharp),
              SizedBox(
                width: 16.w,
              ),
              const Text('MY TODO'),
            ],
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Color.fromARGB(255, 16, 46, 59).withOpacity(0.6),
        body: Obx(
          () => controller.activeList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit_note_sharp, size: 150.sp),
                      Text("Add a task", style: TextStyle(fontSize: 24.sp))
                    ],
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.only(bottom: 100.h),
                  itemCount: controller.activeList.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TodoTile(
                      model: controller.activeList[index],
                      onTap: () => controller.updateList(index),
                      onDelete: () => controller.deleteTask(index),
                    );
                  },
                ),
        ));
  }
}
