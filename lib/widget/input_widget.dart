import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';


class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CustomInput({required this.controller,required this.label,Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:context.mediumValue),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          hintText: "Enter..",
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: (Colors.grey[800])!)),
          border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ),
    );
  }
}
