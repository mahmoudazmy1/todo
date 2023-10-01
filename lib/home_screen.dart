import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_repeat/settings/settings_tab.dart';
import 'package:todo_repeat/task_list/modal_sheet.dart';
import 'package:todo_repeat/task_list/task_list_tab.dart';

class Home_Screen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: 'Task List'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showmodalbottomsheet();
        },
        elevation: 0,
        child: Icon(CupertinoIcons.plus),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    TaskListTab(),
    SettingsTab(),
  ];

  void showmodalbottomsheet() {
    showModalBottomSheet(context: context, builder: (context) => ModalSheet());
  }
}
