import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/functions.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:schooltasks/view/screens/drawerscreens/addtaskscreen.dart';
import 'package:schooltasks/view/screens/drawerscreens/languagedialog.dart';
import 'package:schooltasks/view/screens/drawerscreens/logoutdialog.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    return Drawer(
        backgroundColor: const Color.fromRGBO(116, 66, 122, 1),
        child: ListView(
          children: [
            DrawerHeader(
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(116, 66, 122, 1)),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      'assets/drower.png',
                      fit: BoxFit.fill,
                    ))),
            const SizedBox(
              height: 30,
            ),
            _listTiles(
                label: lan.getTexts(addtask).toString(),
                fct: () {
                  navigateto(context: context, screen: const AddTask());
                },
                icon: Icons.task_outlined),
            _listTiles(
                label: lan.getTexts(account).toString(),
                fct: () {
                  // _navigateToProfileScreen(context);
                },
                icon: Icons.settings_outlined),
            _listTiles(
                label: lan.getTexts(registered).toString(),
                fct: () {
                  // _navigateToAllWorkerScreen(context);
                },
                icon: Icons.workspaces_outline),
            _listTiles(
                label: lan.getTexts(addtask).toString(),
                fct: () {
                  // _navigateToAddTaskScreen(context);
                },
                icon: Icons.add_task_outlined),
            const Divider(
              thickness: 1,
            ),
            _listTiles(
                label: lan.getTexts(chooselang).toString(),
                fct: () {
                  showDialog(
                      context: context,
                      builder: (context) => const LanguageDialog());
                  // _navigateToAddTaskScreen(context);
                },
                icon: Icons.language),
            _listTiles(
                label: lan.getTexts(logouts).toString(),
                fct: () {
                  showDialog(
                      context: context, builder: (context) => const Logout());
                  // _logout(context);
                },
                icon: Icons.logout_outlined),
          ],
        ));
  }

  Widget _listTiles(
      {required String label,
      required VoidCallback fct,
      required IconData icon}) {
    return ListTile(
      onTap: () {
        fct();
      },
      leading: Icon(
        icon,
        color: authcolor,
      ),
      title: Text(
        label,
        style: const TextStyle(
            color: authcolor, fontSize: 20, fontStyle: FontStyle.italic),
      ),
    );
  }
}
