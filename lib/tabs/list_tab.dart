import 'package:assignment_five_flutter/components/todo_widget.dart';
import 'package:assignment_five_flutter/utils/colors.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .12,
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
                      child: Container(color: AppColor.primary,)),
                  Expanded(
                      flex: 4,
                      child: Container(color: AppColor.transparent,)),
                ],
              ),
            ),
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateSelected: (date) => print(date),
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
        Expanded(child: ListView.builder(itemBuilder: (context, index) => const TodoWidget())),
      ],
    );
  }
}
