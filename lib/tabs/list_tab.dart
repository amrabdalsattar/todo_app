import 'package:assignment_five_flutter/components/todo_widget.dart';
import 'package:assignment_five_flutter/utils/colors.dart';
import 'package:assignment_five_flutter/utils/settings_provider.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';

class ListTab extends StatefulWidget {


  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  static late SettingsProvider provider;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshTodoList();
    });
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .12,
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
                      child: Container(
                        color: AppColor.primary,
                      )),
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: AppColor.transparent,
                      )),
                ],
              ),
            ),
            CalendarTimeline(
              initialDate: provider.selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateSelected: (date) {
                provider.selectedDate = date;
                provider.refreshTodoList();
              },
              leftMargin: 20,
              monthColor: AppColor.white,
              dayColor: AppColor.primary,
              activeDayColor: AppColor.primary,
              activeBackgroundDayColor: AppColor.white,
              dotsColor: Colors.transparent,
              showYears: true,
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: provider.todos.length,
                itemBuilder: (context, index) =>
                    TodoWidget(dataModel: provider.todos[index]))),
      ],
    );
  }
}
