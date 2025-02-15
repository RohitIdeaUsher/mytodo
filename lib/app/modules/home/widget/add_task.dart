import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mytodo/app/modules/home/model/todo_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key, this.onAddTask});
  final Function(TodoModel newTask)? onAddTask;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TodoModel? newTask;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add Task",
                  style: TextStyle(color: Colors.white, fontSize: 30.sp)),
              IconButton(
                  onPressed: Get.back,
                  icon: Icon(
                    Icons.clear,
                    size: 35.sp,
                  )),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          commonTextField(titleController, hintText: "Title"),
          SizedBox(
            height: 16.h,
          ),
          commonTextField(descriptionController,
              allowValidation: false,
              hintText: "Description (Optional)",
              maxLine: 5),
          SizedBox(
            height: 32.h,
          ),
          TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.teal.shade900
                    // Color.fromARGB(255, 16, 46, 59).withOpacity(1)
                    ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  toggleBottomSheet();
                  widget.onAddTask?.call(TodoModel(
                    title: titleController.text.trim(),
                    description: descriptionController.text.trim(),
                  ));
                }
              },
              child: Text("Add Task",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white)))
        ],
      ),
    );
  }

  TextFormField commonTextField(TextEditingController controller,
      {String hintText = "", bool allowValidation = true, int maxLine = 1}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      maxLines: maxLine,
      validator: allowValidation
          ? (value) {
              return value?.trim().isNotEmpty ?? false
                  ? null
                  : "Please add title.";
            }
          : null,
      textInputAction: TextInputAction.go,
      // onEditingComplete: () {
      //   // Focus.of(context).unfocus();
      // },
      decoration: InputDecoration(
        label: Text(hintText),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  void toggleBottomSheet() {
    if (Get.isBottomSheetOpen!) Get.until((route) => !Get.isBottomSheetOpen!);
  }
}
