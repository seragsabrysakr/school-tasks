import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:schooltasks/view/screens/auth/forgeypassword.dart';
import 'package:schooltasks/view/screens/auth/signup.dart';
import 'package:schooltasks/view/widget/sbutton.dart';
import 'package:schooltasks/view/widget/stext.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:schooltasks/view/widget/stextformfield.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool showPassword = true;
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _animationController.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat(reverse: true);
    _animation = CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: _animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationstatus) {
        if (animationstatus == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var txt = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: isEn == true ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/schooltask.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: FractionalOffset(_animation.value, 0),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.3,
                          ),
                          // sign in
                          Row(
                            children: [
                              CustomText(
                                data: txt.getTexts(signin).toString(),
                                size: 25.sp,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          //dont have account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: txt
                                          .getTexts(donthaveaccount)
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(text: '   '),
                                    TextSpan(
                                      text: txt.getTexts(signup).toString(),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen(),
                                                )),
                                      style: TextStyle(
                                          color: Colors.blue.shade300,
                                          decoration: TextDecoration.underline,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //email text field
                          CustomTextField(
                              focusNode: emailFocusNode,
                              type: TextInputType.emailAddress,
                              controller: emailcontroller,
                              label: txt.getTexts(email).toString(),
                              validator: (valeu) {
                                if (valeu!.isEmpty) {
                                  return txt.getTexts(formerror).toString();
                                } else {
                                  return null;
                                }
                              }),
                          //password text field
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                              focusNode: passFocusNode,
                              type: TextInputType.number,
                              obscure: showPassword,
                              visiblpass: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              suffix: showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              controller: passcontroller,
                              label: txt.getTexts(password).toString(),
                              validator: (valeu) {
                                if (valeu!.isEmpty) {
                                  return txt.getTexts(formerror).toString();
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          //forget password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPasswordScreen(),
                                      ));
                                },
                                child: CustomText(
                                  color: Colors.grey,
                                  data: txt.getTexts(forgitpassword).toString(),
                                  size: 14.sp,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CustomButton(
                              color: buttoncolor,
                              text: txt.getTexts(signin).toString(),
                              width: 70.w,
                              radius: 10,
                              height: 10.w,
                              onpressed: () async {
                                FocusScope.of(context).unfocus();
                                // bool result = await InternetConnectionChecker()
                                //     .hasConnection;
                                // if (result == true) {
                                //   if (_formKey.currentState!.validate()) {

                                //   } else {
                                //     return showdialog(
                                //         context,
                                //         txt.getTexts(formerror).toString(),
                                //         dialogcolor);
                                //   }
                                // } else {
                                //   return showdialog(
                                //       context,
                                //       txt.getTexts(connectionerror).toString(),
                                //       Colors.amberAccent);
                                // }
                                setState(() {
                                  isEn = !isEn;
                                });
                                SharedPreferences language =
                                    await SharedPreferences.getInstance();
                                language.setBool('lang', isEn);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
