import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_repeat/firebase_utils.dart';
import 'package:todo_repeat/models/task.dart';
import 'package:todo_repeat/providers/list_provider.dart';

class ModalSheet extends StatefulWidget {
  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  DateTime selectedTime = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Add new task',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    title = text;
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please enter the task discreption';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'enter the task title',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    description = text;
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please enter the task title';
                    }
                    return null;
                  },
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'enter the task description',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'select date',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              InkWell(
                onTap: () {
                  showcalender();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${selectedTime.day}/'
                    '${selectedTime.month}/${selectedTime.year}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    onAdd();
                  },
                  child: Text(
                    'Add',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void showcalender() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedTime = chosenDate;
    }
    setState(() {});
  }

  void onAdd() {
    formKey.currentState!.validate();
    Task task =
        Task(title: title, description: description, dateTime: selectedTime);
    FirebaseUtils.addTaskToFirebase(task).timeout(Duration(milliseconds: 500),
        onTimeout: () {
      print('successfully');
      listProvider.getAllTasksFromFirestore();
      Navigator.pop(context);
    });
  }
}
