import 'package:flash/flash.dart';
import 'package:flutter/material.dart';


showdialog(context, String text, Color color,{double? fontsize=16}) {
  return showFlash(
      duration: const Duration(seconds: 2),
      context: context,
      builder: (context, controller) {
        return Flash.dialog(
            alignment: Alignment.bottomCenter,
            margin:const EdgeInsets.only(bottom: 70),
            backgroundColor: color,
            borderRadius: BorderRadius.circular(20),
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.info_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      maxLines: 1,

                      style: TextStyle(color: Colors.white, fontSize: fontsize),
                    ),
                  ),
                ],
              ),
            ));
      });
}
