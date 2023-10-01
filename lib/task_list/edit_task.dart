import 'package:flutter/material.dart';
import 'package:todo_repeat/my_theme.dart';

class EditTask extends StatelessWidget {
  static const String routeName = 'edit_task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: MyTheme.whiteColor),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Edit Task',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: MyTheme.blackColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'enter the task title',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'enter the task title',
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Select time',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Text('27-6-2021',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 18)),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      StadiumBorder(
                        side: BorderSide(width: 2),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'save changes',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyTheme.whiteColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
