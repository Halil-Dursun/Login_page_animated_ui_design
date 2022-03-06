import 'package:flutter/material.dart';
import 'package:ui_design1/styles/colors.dart';

Widget customTextField({required IconData icon,required TextEditingController controller,required String hint}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20),),
        color: colorMedium.withOpacity(.2),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Icon(icon,size: 30,color: colorDark,),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}