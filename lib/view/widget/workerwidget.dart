import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/functions.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/model/taskmodel.dart';
import 'package:schooltasks/model/workermodel.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:schooltasks/view/screens/drawerscreens/workerdetails.dart';

class WorkerWidget extends StatelessWidget {
  final WorkerModel worker;
  const WorkerWidget({
    Key? key,
     required this.worker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txt = Provider.of<LanguageProvider>(context, listen: true);

    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {
          navigateto(context: context,screen: WorkerDetails());
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              txt.getTexts(deletetask).toString(),
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            )
                          ],
                        ))
                  ],
                );
              });
        },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0),
            ),
          ),
          child: const CircleAvatar(
            backgroundColor: Color.fromARGB(0, 80, 1, 1),
            radius: 20,
            child: Icon(
              Icons.alarm,
              size: 40,
            ),
          ),
        ),
        title: Text(
          worker.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: secondcolor,
          ),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.linear_scale,
              color: Colors.pink.shade800,
            ),
            Text(
             worker.jobtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.mail,
            size: 30,
            color: Colors.pink[800],
          ),
        ),
      ),
    );
  }
}
