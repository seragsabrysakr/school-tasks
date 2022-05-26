import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';
import 'package:schooltasks/constants/functions.dart';
import 'package:schooltasks/constants/strings.dart';
import 'package:schooltasks/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:schooltasks/view/widget/sbutton.dart';
import 'package:schooltasks/view/widget/stext.dart';
import 'package:schooltasks/view/widget/stextformfield.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var categorycontroller = TextEditingController();
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var datecontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var txt = Provider.of<LanguageProvider>(context, listen: true);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
          txt.getTexts(addtask).toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: CustomButton(
                    color: txtcolor,
                    height: 40,
                    text: 'Add Field are Required',
                    onpressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomText(
                    size: 20,
                    weight: FontWeight.bold,
                    color: buttoncolor,
                    data: txt.getTexts(category).toString() + '*'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    onedit: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  cat(categorycontroller.text);
                                });
                              },
                              child: AlertDialog(
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
                                                  categ = taskCategoryList[index];
                                                  // print(categ);
                                                  navigateback(context);
                                                });
                                              },
                                              child: CustomText(
                                                data:
                                                   taskCategoryList[index],
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
                        ),
                            );
                          });
                    },
                    fillcolor: Colors.grey.shade200,
                    controller: categorycontroller,
                    focusNode: FocusNode(),
                    hint: categ,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return txt.getTexts(formerror).toString();
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomText(
                    size: 20,
                    weight: FontWeight.bold,
                    color: buttoncolor,
                    data: txt.getTexts(taskTitle).toString() + '*'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    maxlenth: 100,
                    fillcolor: Colors.grey.shade200,
                    controller: titlecontroller,
                    focusNode: FocusNode(),
                    hint: txt.getTexts(taskTitle).toString(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return txt.getTexts(formerror).toString();
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomText(
                    size: 20,
                    weight: FontWeight.bold,
                    color: buttoncolor,
                    data: txt.getTexts(taskDescription).toString() + '*'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    maxlenth: 1000,
                    fillcolor: Colors.grey.shade200,
                    max: 3,
                    min: 3,
                    controller: descriptioncontroller,
                    focusNode: FocusNode(),
                    hint: txt.getTexts(taskDescription).toString(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return txt.getTexts(formerror).toString();
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomText(
                    size: 20,
                    weight: FontWeight.bold,
                    color: buttoncolor,
                    data: txt.getTexts(deadline).toString() + '*'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    fillcolor: Colors.grey.shade200,
                    controller: datecontroller,
                    focusNode: FocusNode(),
                    hint: txt.getTexts(deadline).toString(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return txt.getTexts(formerror).toString();
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: MaterialButton(
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: txtcolor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: CustomText(
                        size: 18,
                        weight: FontWeight.bold,
                        data: txt.getTexts(upload).toString()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void cat(String controller) {
    controller = categ;
    // print(categ);
    print(controller);
  }
}
