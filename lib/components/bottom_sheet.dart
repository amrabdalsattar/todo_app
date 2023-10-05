import 'package:assignment_five_flutter/common/my_text_field.dart';
import 'package:assignment_five_flutter/utils/app_theme.dart';
import 'package:flutter/material.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Add new Task",
            style: AppThemes.bottomSheetTextStyle,
          ),

          /// Text Fields
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7885922330097087,
            child: Column(
              children: [
                MyTextField(hintText: "Enter task Title",),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(hintText: "Enter task Discretion",),
              ],
            ),
          ),
          Text("Select Date",
              style: AppThemes.bottomSheetTextStyle
                  .copyWith(fontWeight: FontWeight.w600)),
          Text("10/4/2023",
              style: AppThemes.bottomSheetTextStyle
                  .copyWith(fontWeight: FontWeight.normal)),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(onPressed: () {}, child: const Text("add")))
        ],
      ),
    );
  }
}
