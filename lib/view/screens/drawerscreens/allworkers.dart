import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/global.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/model/workermodel.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:schooltasks/constants/functions.dart';
import 'package:schooltasks/view/widget/stext.dart';
import 'package:schooltasks/view/widget/workerwidget.dart';

class RegestiredWorkers extends StatefulWidget {
  const RegestiredWorkers({Key? key}) : super(key: key);

  @override
  State<RegestiredWorkers> createState() => _RegestiredWorkersState();
}

class _RegestiredWorkersState extends State<RegestiredWorkers> {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var txt = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: isEn == true ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                navigateback(context);
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: secondcolor,
          centerTitle: true,
          elevation: 1,
          title: Text(
            txt.getTexts(registered).toString(),
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  data: 'Task Category',
                                  color: buttoncolor,
                                  size: 20,
                                  weight: FontWeight.bold,
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: buttoncolor,
                                )
                              ],
                            ),
                          ),
                          elevation: 1,
                          content: SizedBox(
                            width: size.width * .7,
                            height: size.height * .3,
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: InkWell(
                                    child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.check_circle,
                                              color: buttoncolor,
                                            ),
                                            const SizedBox(width: 10),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  navigateback(context);
                                                });
                                              },
                                              child: CustomText(
                                                data: taskCategoryList[index],
                                                color: secondcolor,
                                                weight: FontWeight.bold,
                                                size: 20,
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.canPop(context)
                                      ? Navigator.pop(context)
                                      : null;
                                },
                                child: CustomText(
                                    data: 'Cancel',
                                    color: buttoncolor,
                                    size: 20,
                                    weight: FontWeight.bold))
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.filter_alt_outlined))
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return WorkerWidget(worker: worker);
          },
        ),
      ),
    );
  }
}
