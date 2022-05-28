import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/functions.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/view/widget/sbutton.dart';

import '../../../providers/language_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  dialog(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);

    return Directionality(
      textDirection: isEn == false ? TextDirection.rtl : TextDirection.ltr,
      child: Align(
        alignment: Alignment.center,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * 0.34,
            child: ListView(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: const EdgeInsets.all(1),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: buttoncolor)),
                              width: 80,
                              height: 70,
                              child: const Icon(
                                Icons.logout,
                                size: 60,
                                color: txtcolor,
                              ))),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      lan.getTexts(wanalogout).toString(),
                      style: const TextStyle(color: buttoncolor, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      color: txtcolor,
                      text: isEn ? 'No' : 'لا',
                      onpressed: () {
                        navigateback(context);
                      },
                      width: MediaQuery.of(context).size.width * 0.03,
                      radius: 5,
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      color: txtcolor,
                      text: isEn ? 'Yes' : 'نعم',
                      onpressed: () async {},
                      width: MediaQuery.of(context).size.width * 0.03,
                      radius: 5,
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialog(context));
  }
}
