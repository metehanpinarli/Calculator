import 'package:calculator_task/bloc/button/button_bloc.dart';
import 'package:calculator_task/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class ActionButton extends StatefulWidget {
  bool selected;
  final IconData icon;
  final String title;
  final String operator;

  ActionButton({required this.selected, required this.icon, required this.title, required this.operator, Key? key}) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.normalValue),
      child: ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          leading: Icon(widget.icon),
          title: Text(
            widget.title,
            style: TextStyle(color: widget.selected ? Colors.white : Colors.grey[800]),
          ),
          trailing: widget.selected ? const Icon(Icons.check_circle_outlined) : const Icon(Icons.circle_outlined),
          selected: widget.selected,
          shape: RoundedRectangleBorder(side: BorderSide(color: widget.selected ? Colors.white : (Colors.grey[900])!), borderRadius: BorderRadius.circular(10)),
          onTap: () {
            context.read<CalculatorBloc>().add(CalculatorAddOperator(widget.operator));
            context.read<ButtonBloc>().add(ButtonClicked(widget.selected));
            setState(() {
              widget.selected=!widget.selected;
            });
          },
        ),
      ),
    );
  }
}
