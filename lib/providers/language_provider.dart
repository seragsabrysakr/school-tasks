import 'package:flutter/material.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Map<String, Object> textsAr = {
    // strings for authentication
    //login
    signin: 'تسجيل الدخول',
    signup: 'أنشاء حساب',
    email: 'البريد الالكتروني',
    password: 'كلمه السر',
    forgitpassword: 'هل نسيت كلمه السر؟',
    donthaveaccount: " ليس لديك حساب؟",
    formerror: "رجاء ملئ كل الحقول",
    connectionerror: 'تأكد من الاتصال بالانترنت',
    //sign up
    fullname: 'الاسم بالكامل ',
    position: 'منصبك في المدرسة',
    haveaccount: 'لديك حساب بالفعل',
    resetnow: 'أعادة الضبط اﻷن',
    resethint: '  اكتب بريدك الالكنروني هنا',
//strings of home screen
    alltasks: 'كل المهمات',

    taskTitle: 'العنوان الرئيسي',
    csubtitle: 'العنوان الفرعي',
    taskDescription: 'المحتوي',
    deletetask: 'مسح المهمة',
//logout
    wanalogout: 'هل انت متأكد من تسجيل الخروج',
    //language
    chooselang: 'تغيير اللغة',
    //drawer
    account: 'حسابي ',
    registered: 'الموظفين',
    addtask: 'أضافة مهمه',
    logouts: 'تسجيل الخروج',
     //category
    category: 'الاقسام',
    deadline:'الموعد المقرر للمهمه',
    upload: 'أضافة ',
    profile:'ملفي الشخصي',
    contact:'معلومات الاتصال',
    phone:'رقم التليفون',
  };
  Map<String, Object> textsEn = {
    // strings for authentication
    signin: 'Sign In',
    signup: 'Sign Up',
    email: 'Email',
    password: 'Password',
    forgitpassword: 'Forget Password?',
    donthaveaccount: "Don't have account?",
    formerror: 'please fill all fields',
    connectionerror: 'check connection',
    //sign up
    fullname: 'Full Name',
    position: 'Position in The School',
    haveaccount: 'Already have an account?',
    resetnow: 'Reset Now',
    resethint: 'Enter your Email here',
    //strings of home screen
    alltasks: 'AllTasks',
    taskTitle: 'Task Title',
    csubtitle: 'subtitle',
    taskDescription: 'Task Description',
    deletetask: 'Delete Task',
    //logout
    wanalogout: 'Are you sure you \n want to log out?',
    //language
    chooselang: 'Chang Language',
    //drawer
    account: 'My account',
    registered: 'Registered workes',
    addtask: 'Add task',
    logouts: 'Logout',
    //category
     category : 'Category',
     deadline:'Tasks Deadline Date',
     upload:'Upload',
    profile:'Profile',
    contact:'Contact Info',
    phone:'Phone Number',

  };

  changeLan(bool lan) async {
    isEn = lan;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isEn", isEn);
  }

  getLan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEn = prefs.getBool("isEn") ?? true;
    notifyListeners();
  }

  Object? getTexts(String txt) {
    if (isEn == true) {
      return textsEn[txt] ?? txt;
    } else {
      return textsAr[txt] ?? textsAr;
    }
  }
}
