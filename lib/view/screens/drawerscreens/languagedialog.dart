import 'package:schooltasks/constants/functions.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/view/screens/tasks/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../../providers/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Align(
          alignment: Alignment.center,
          child: Stack(clipBehavior: Clip.none, children: [
            Container(
              color: const Color(0xFFFFFFFF),
              width: 300,
              height: 300,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 140,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1),
                          child: isEn != false
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    Icons.circle_rounded,
                                    color: Color.fromRGBO(116, 66, 122, 1),
                                  ))
                              : const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    Icons.circle_outlined,
                                    color: Color.fromRGBO(116, 66, 122, 1),
                                  )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEn = true;
                            });
                          },
                          child: Text(
                            'ُEnglish',
                            style: TextStyle(
                                color: Colors.blueGrey.shade900, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(1),
                          child: isEn == false
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    Icons.circle_rounded,
                                    color: Color.fromRGBO(116, 66, 122, 1),
                                  ),
                                )
                              : const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    Icons.circle_outlined,
                                    color: Color.fromRGBO(116, 66, 122, 1),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEn = false;
                            });
                          },
                          child: Text(
                            'اللغة العربية',
                            style: TextStyle(
                                color: Colors.blueGrey.shade900, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: const Color.fromRGBO(116, 66, 122, 1),
                        child: Text(
                          // submit,
                          isEn ? 'submit' : 'تأكيد',
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          SharedPreferences language =
                              await SharedPreferences.getInstance();
                          language.setBool('lang', isEn);
                          navigatefinish(
                              context: context,
                              screen: const TasksHomeScreen());
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        color: Colors.red,
                        child: Text(
                          // cancel,
                          isEn ? 'cansel' : 'الغاء',
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromRGBO(116, 66, 122, 1),
              width: 300,
              height: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    lan.getTexts(chooselang).toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: -40,
              right: 110,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.language,
                  color: Color.fromRGBO(116, 66, 122, 1),
                  size: 50,
                ),
              ),
            ),
          ]),
        ));
  }
}
