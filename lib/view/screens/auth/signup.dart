import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:schooltasks/view/screens/auth/login.dart';
import 'package:provider/provider.dart';
import 'package:schooltasks/view/widget/flashdialog.dart';
import 'package:schooltasks/view/widget/sbutton.dart';
import 'package:schooltasks/view/widget/stext.dart';
import 'package:schooltasks/view/widget/stextformfield.dart';
import 'package:sizer/sizer.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  bool showPassword = true;

  late AnimationController _animationController;
  late Animation<double> _animation;
  late final TextEditingController _fullnameTextController =
      TextEditingController(text: '');
  late final TextEditingController _emailTextController =
      TextEditingController(text: '');
  late final TextEditingController _passTextController =
      TextEditingController(text: '');
  late final TextEditingController _positionCPTextController =
      TextEditingController(text: '');

  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  final FocusNode _positionFocusNode = FocusNode();
  final _signUpFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _animationController.dispose();
    _fullnameTextController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _positionCPTextController.dispose();
    _fullnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _positionFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  void submitFormOnSignUp() {
    final isValid = _signUpFormKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('Form valid');
    } else {
      print('Form not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    var txt = Provider.of<LanguageProvider>(context, listen: true);

    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: isEn == true ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
          // backgroundColor: Colors.red,
          body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/schooltask.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: FractionalOffset(_animation.value, 0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                  ),
                  //sign up
                  Row(
                    children: [
                      CustomText(
                        data: txt.getTexts(signup).toString(),
                        size: 20.sp,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: txt.getTexts(haveaccount).toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: '   '),
                        TextSpan(
                          text: txt.getTexts(signin).toString(),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                ),
                          style: TextStyle(
                              color: Colors.blue.shade300,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            action: TextInputAction.next,
                            onedit: () => FocusScope.of(context)
                                .requestFocus(_fullnameFocusNode),
                            focusNode: _fullnameFocusNode,
                            type: TextInputType.name,
                            controller: _fullnameTextController,
                            hint: txt.getTexts(fullname).toString(),
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
                        //email text field
                        CustomTextField(
                            action: TextInputAction.next,
                            focusNode: _emailFocusNode,
                            type: TextInputType.emailAddress,
                            controller: _emailTextController,
                            hint: txt.getTexts(email).toString(),
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
                            action: TextInputAction.next,
                            focusNode: _passFocusNode,
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
                            controller: _passTextController,
                            hint: txt.getTexts(password).toString(),
                            validator: (valeu) {
                              if (valeu!.isEmpty) {
                                return txt.getTexts(formerror).toString();
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        //position text field
                        CustomTextField(
                            action: TextInputAction.done,
                            focusNode: _positionFocusNode,
                            type: TextInputType.name,
                            controller: _positionCPTextController,
                            hint: txt.getTexts(position).toString(),
                            validator: (valeu) {
                              if (valeu!.isEmpty) {
                                return txt.getTexts(formerror).toString();
                              } else {
                                return null;
                              }
                            }),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: CustomButton(
                      color: buttoncolor,
                      text: txt.getTexts(signup).toString(),
                      width: 70.w,
                      radius: 10,
                      height: 10.w,
                      onpressed: () async {
                        FocusScope.of(context).unfocus();
                        bool result =
                            await InternetConnectionChecker().hasConnection;
                        if (result == true) {
                          if (_signUpFormKey.currentState!.validate()) {
                            // lan.getTexts('Success').toString(),
                            // dialogcolor);
                          } else {
                            return showdialog(
                                context,
                                txt.getTexts(formerror).toString(),
                                secondcolor);
                          }
                        } else {
                          return showdialog(
                              context,
                              txt.getTexts(connectionerror).toString(),
                              Colors.amberAccent);
                        }
                        // setState(()  {
                        //   isEn=!isEn;
                        // });
                        // SharedPreferences language = await SharedPreferences.getInstance();
                        // language.setBool('lang', isEn);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
