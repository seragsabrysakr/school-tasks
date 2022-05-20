import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:schooltasks/view/widget/taskwidget.dart';

class TasksHomeScreen extends StatefulWidget {
  const TasksHomeScreen({Key? key}) : super(key: key);

  @override
  State<TasksHomeScreen> createState() => _TasksHomeScreenState();
}

class _TasksHomeScreenState extends State<TasksHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var txt = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: isEn == true ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: secondcolor,
          centerTitle: true,
          elevation: 1,
          title: Text(
            txt.getTexts(alltasks).toString(),
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined))
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return TaskWidget(
              taskTitle: taskTitle,
              taskDescription: taskDescription,
            );
          },
        ),
      ),
    );
  }
}
