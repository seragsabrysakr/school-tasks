import 'package:flutter/material.dart';
import 'constants/strings.dart';
import 'providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'view/screens/tasks/taskhomescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((value) {
    isEn = value.getBool('lang') ?? true;
  });
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
    ),
  ], child: const SchoolTasks()));
}

class SchoolTasks extends StatelessWidget {
  const SchoolTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksHomeScreen(),
      );
    });
  }
}
