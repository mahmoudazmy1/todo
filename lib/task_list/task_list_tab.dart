import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_repeat/my_theme.dart';
import 'package:todo_repeat/providers/list_provider.dart';
import 'package:todo_repeat/task_list/task_widget.dart';

class TaskListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listprovider = Provider.of<ListProvider>(context);
    if (listprovider.taskList.isEmpty) {
      listprovider.getAllTasksFromFirestore();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: MyTheme.primaryLight,
            dayColor: Colors.teal[200],
            activeDayColor: MyTheme.whiteColor,
            activeBackgroundDayColor: MyTheme.primaryLight,
            dotsColor: MyTheme.blackColor,
            selectableDayPredicate: (date) => true,
            locale: 'en',
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listprovider.taskList.length,
              itemBuilder: (context, index) {
                return TaskWidgetItem(
                  task: listprovider.taskList[index],
                );
              }),
        )
      ],
    );
  }
}
