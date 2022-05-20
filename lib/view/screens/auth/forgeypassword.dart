import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:schooltasks/view/widget/sbutton.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late final TextEditingController _forgetPasswordController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _animationController.dispose();
    _forgetPasswordController.dispose();

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

  void _forgetpasswordFCT() {
    print('_forgetPasswordController.text ${_forgetPasswordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var txt = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: isEn == true ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
          extendBodyBehindAppBar: true,
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
                      Text(
                        txt.getTexts(forgitpassword).toString(),
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        txt.getTexts(email).toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                          controller: _forgetPasswordController,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: txtcolor),
                            hintText: '',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.pink.shade700),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: CustomButton(
                          color: buttoncolor,
                          text: txt.getTexts(resetnow).toString(),
                          width: 70.w,
                          radius: 10,
                          height: 10.w,
                          onpressed: _forgetpasswordFCT,
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
