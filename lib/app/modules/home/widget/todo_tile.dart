import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytodo/app/modules/home/model/todo_model.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.model, this.onTap, this.onDelete});
  final TodoModel model;
  final Function()? onTap;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.0.h),
      child: ListTile(
        onTap: onTap,
        leading: Icon(Icons.art_track_sharp, size: 32.sp),
        title: Text(model.title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16.sp,
                decoration:
                    model.status ?? false ? TextDecoration.lineThrough : null)),
        subtitle: model.description?.isNotEmpty ?? false
            ? Text(
                model.description ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12.sp,
                    decoration: model.status ?? false
                        ? TextDecoration.lineThrough
                        : null),
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onDelete,
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
            Checkbox(
                value: model.status ?? false,

                // subtitle: Text("Subtitle"),
                onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
