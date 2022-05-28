import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/functions.dart';
import 'package:schooltasks/constants/global.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/view/widget/socialbutton.dart';
import 'package:schooltasks/view/widget/stext.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var txt = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: isEn == true ? TextDirection.ltr : TextDirection.rtl,

      child: Scaffold(
        backgroundColor: Colors.grey,
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
            txt.getTexts(profile).toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: SizedBox(
              height: size.height * .45,
              width: size.width * .7,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  //image
                  Positioned(
                    left: size.width * .27,
                    top: -size.height * .04,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 35,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 28,
                        child: ClipOval(
                          clipBehavior: Clip.hardEdge,
                          child: CachedNetworkImage(
                            // color: Colors.red,
                            imageUrl: '',
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/drower.png',
                              scale: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            CustomText(
                              data: worker.name,
                              color: secondcolor,
                              weight: FontWeight.bold,
                              size: 22,
                            ),
                            CustomText(
                              data: worker.jobtitle,
                              color: buttoncolor,
                              weight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 3,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0)
                        ,
                        child: Column(

                          children: [
                            Row(
                              children: [
                                CustomText(
                                  data: txt.getTexts(contact).toString() + " : ",
                                  color: secondcolor,
                                  weight: FontWeight.bold,
                                  size: 17,
                                ),
                                CustomText(
                                  data: '',
                                  color: buttoncolor,
                                  weight: FontWeight.bold,
                                  size: 13,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  data: txt.getTexts(email).toString() + " : ",
                                  color: secondcolor,
                                  weight: FontWeight.bold,
                                  size: 17,
                                ),
                                CustomText(
                                  data: worker.mail,
                                  color: buttoncolor,
                                  weight: FontWeight.bold,
                                  size: 13,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  data: txt.getTexts(phone).toString() + " : ",
                                  color: secondcolor,
                                  weight: FontWeight.bold,
                                  size: 17,
                                ),
                                CustomText(
                                  data: worker.phone,
                                  color: buttoncolor,
                                  weight: FontWeight.bold,
                                  size: 13,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     SocialButton(color: buttoncolor, icon: Icons.mail_outline_outlined, ontap: (){}),
                            //     SocialButton(color: Colors.blue, icon: Icons.phone, ontap: (){}),
                            //     SocialButton(color: Colors.green, icon: Icons.whatsapp_outlined, ontap: (){}),
                            //   ],
                            // ),
                            MaterialButton(
                              minWidth: 150,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: txtcolor,
                              onPressed: () {

                              },
                              child: CustomText(
                                  size: 18,
                                  weight: FontWeight.bold,
                                  data: txt.getTexts(logouts).toString()),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),


                ],
              )),
        ),
      ),
    );
  }
}
