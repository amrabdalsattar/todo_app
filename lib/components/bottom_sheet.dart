import 'package:assignment_five_flutter/common/my_text_field.dart';
import 'package:assignment_five_flutter/screens/home_screen.dart';
import 'package:assignment_five_flutter/utils/app_theme.dart';
import 'package:assignment_five_flutter/utils/colors.dart';
import 'package:assignment_five_flutter/utils/settings_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  TextEditingController taskTitle = TextEditingController();

  TextEditingController taskDescription = TextEditingController();

  DateTime selectedDate = DateTime.now();

  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
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
                MyTextField(
                    hintText: "Enter task Title", controller: taskTitle),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: "Enter task Discretion",
                  controller: taskDescription,
                ),
              ],
            ),
          ),
          Text("Select Date",
              style: AppThemes.bottomSheetTextStyle
                  .copyWith(fontWeight: FontWeight.w600)),

          /// Date
          InkWell(
            onTap: () {
              showMyDatePicker();
            },
            child: Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                style: AppThemes.bottomSheetTextStyle.copyWith(
                    fontWeight: FontWeight.normal, color: AppColor.grey)),
          ),

          /// Add Btn
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  onPressed: () {
                    addTodoToFirestore();
                    HomeScreen.provider.refreshTodoList();
                  },
                  child: const Text("add")))
        ],
      ),
    );
  }

  void addTodoToFirestore() {
    CollectionReference todosCollectionRef =
        FirebaseFirestore.instance.collection("todos");

    DocumentReference newEmptyDoc = todosCollectionRef.doc();
    newEmptyDoc.set({
      "title": taskTitle.text,
      "description": taskDescription.text,
      "isDone": false,
      "date": selectedDate,
      "id": newEmptyDoc.id,
    }).timeout(const Duration(milliseconds: 300), onTimeout: () {
      provider.refreshTodoList();
      Navigator.pop(context);
    });
  }

  void showMyDatePicker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
}
